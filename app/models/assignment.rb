# frozen_string_literal: true

class Assignment < ApplicationRecord
  belongs_to :course
  delegate :user, to: :course, allow_nil: false

  # find all assignments for active user
  # # TODO: personalize once skateboard is up & auth implemented
  def self.user_asgmts(user_id)
    return all.filter { |a| a.user.id == 1 }
  end

  # get all user assignments in date order starting from back
  # # TODO: make this more flexible once the algorithm is working
  #         (so this method can be used before & after flattening)
  def self.ordered(asgmt_arr)
    return asgmt_arr.sort_by(&:adj_date).reverse
  end

  # create hash to store arrays of date-grouped assignments
  # # TODO: syllabi list due date, so push all dates back by one for 'work' date
  def self.date_grouped
    flat_list = self.ordered(user_asgmts(1))
    grouped_list = {}
    flat_list.each do |a|
      if grouped_list[a.adj_date]
        grouped_list[a.adj_date] << a.slice(:description, :og_date, :adj_date, :course_id)
      else
        grouped_list[a.adj_date] = []
        grouped_list[a.adj_date] << a.slice(:description, :og_date, :adj_date, :course_id)
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
    # active_day = first schedule hash entry (last day with assignments)
    # prev_day = active day - 1
    avg = avg_per_day(user_asgmts(1))
    schedule = date_grouped

    # first, spread into empty days
    #   check if prev_day is empty
    #     √ if not, prev_day becomes active_day and new prev_day is one before that
    #     √ if it IS empty, add it to working array
    #     √ keep looking back days and add them to the working array until you hit a non-empty day
    #     while active_day asgmts > avg AND active_day asgmts >
    #       move an asgmt from active_day to each day in working array, earliest -> latest
    #       if every day gets an asgmt & asgmts remain, do the above loop till you run out
    #     once this chunk has been spread out:
    #       active_day = day before earliest in working array
    #       prev_day = active_day - 1
    #       clear out working array
    #       go back to the top of this whole loop

    schedule.each do |active_day, asgmts|
      # active_day -> day being looped over right now
      # asgmts -> array of hashes, each hash an asgmt object
      empty_days = []

      # fill array with all empty days before active day
      prev_day = (active_day - 1)
      while !schedule[prev_day]
        empty_days << prev_day
        prev_day = (prev_day - 1)
      end

      # create hash keys for each of the entry days
      # note this is just so the while-loop logic below works
      # the actual date adjustment takes place on the adj_date value
      empty_days.each do |day|

      end

      while asgmts > avg && asgmts

      end
    end
  end

  # THE sorting algorithm to spread out assignments
  def self.flattened
    # once all days have something, spread those out evenly as possible

    self.ordered(user_asgmts(1))
    self.date_grouped
  end
end
