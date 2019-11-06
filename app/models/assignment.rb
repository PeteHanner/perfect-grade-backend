# frozen_string_literal: true

class Assignment < ApplicationRecord
  belongs_to :course
  # delegate :user, to: :course, allow_nil: false

  # find all assignments for active user
  # # TODO: personalize once skateboard is up & auth implemented
  def self.user_asgmts(user_id)
    current_user = User.find(1)
    return current_user.assignments
  end

  # get all user assignments in date order starting from back
  # # TODO: make this more flexible once the algorithm is working
  # (so this method can be used before & after flattening)
  def self.ordered(asgmt_arr)
    return asgmt_arr.sort_by(&:adj_date).reverse
  end

  def serialized
    {
      id: self.id,
      description: self.description,
      og_date: self.og_date,
      adj_date: self.adj_date,
      course_id: self.course_id
    }
  end

  # create hash to store arrays of date-grouped assignments
  # # TODO: syllabi list due date, so push all dates back by one for 'work' date
  def self.date_grouped(asgmt_arr)
    flat_list = self.ordered(asgmt_arr)
    grouped_list = {}
    flat_list.each do |a|
      if grouped_list[a.adj_date]
        grouped_list[a.adj_date] << a.serialized
      else
        grouped_list[a.adj_date] = []
        grouped_list[a.adj_date] << a.serialized
      end
    end
    return grouped_list
  end

  # calculate average number of assignments per day, rounding up
  def self.avg_per_day(asgmt_arr)
    assignment_count = self.ordered(user_asgmts(1)).length
    first_day = self.ordered(user_asgmts(1)).last.og_date
    last_day = self.ordered(user_asgmts(1)).first.og_date
    semester_length = (last_day - first_day).to_i
    (assignment_count.to_f / semester_length.to_f).ceil
  end

  def self.no_empty_days
    avg = avg_per_day(self.user_asgmts(1))
    schedule = self.date_grouped(self.user_asgmts(1))

    # first, spread into empty days
    #   √check if prev_day is empty
    #     √ if not, prev_day becomes active_day and new prev_day is one before that
    #     √ if it IS empty, add it to working array
    #     √ keep looking back and add days to working array until you hit a non-empty day
    #     if empty days >= asgmts:
    #       √ move one asgmt from active_day to each of the empty days, starting earliest
    #     otherwise:
    #       while og day asgmts > prev day asgmts && # of moves < total asgmts to be moved
    #         move asgmts back starting earliest

    #     once this chunk has been spread out:
    #       active_day = day before earliest in working array
    #       prev_day = active_day - 1
    #       clear out working array
    #       go back to the top of this whole loop

    schedule.each do |active_day, asgmts|
      # active_day -> day being looped over right now
      # asgmts -> array of hashes, each hash an asgmt object

      # fill array with all empty days before active day
      # # TODO: THIS LOGIC DON'T WORK
      empty_days = []
      prev_day = (active_day - 1)
      until schedule[prev_day] || active_day == schedule.keys[-1] do
        empty_days << prev_day
        prev_day = (prev_day - 1)
      end
      empty_days = empty_days.reverse

      i = 0
      # if more empty days than asgmts, spread them back 1 per day
      if empty_days.length >= asgmts.length
        while i < asgmts.length
          asgmts[i]['adj_date'] = empty_days[i]
          i += 1
        end
      else
        # spread asgmts (roughly) evenly across empty days
        asgmts_left = asgmts.length
        stop_ctr = 0
        move_ctr = 0
        while asgmts_left > stop_ctr && move_ctr < asgmts.length
          while i < empty_days.length
            asgmts[i]['adj_date'] = empty_days[i]
            move_ctr += 1
            asgmts_left -= 1
            i += 1
          end
          stop_ctr += 1
        end
      end
    end

    # return self.ordered(schedule.values.flatten)
    return schedule
  end

  # THE sorting algorithm to spread out assignments
  def self.flattened
    # once all days have something, spread those out evenly as possible
  end

  def self.test_output
    # self.ordered(user_asgmts(1))
    # self.date_grouped(user_asgmts(1))
    # self.date_grouped(self.no_empty_days)
    self.no_empty_days
  end

  # may use or not use this in actuality; does need to be applied somewhere
  # to filter JSON
  def serializer
    asgmt.slice(:description, :og_date, :adj_date, :course_id)
  end
end
