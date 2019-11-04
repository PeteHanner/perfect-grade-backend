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
    return asgmt_arr.sort_by(&:adj_date)
  end

  # create hash to store arrays of date-grouped assignments
  # # TODO: syllabi list due date, so push all dates back by one for 'work' date
  def self.date_grouped(asgmt_arr)
    flat_list = self.ordered(asgmt_arr)
    grouped_list = {}
    flat_list.each do |a|
      if grouped_list[a.adj_date]
        grouped_list[a.adj_date] << a
      else
        grouped_list[a.adj_date] = []
        grouped_list[a.adj_date] << a
      end
    end
    return grouped_list
  end

  # calculate average number of assignments per day, rounding up
  def self.avg_per_day(_asgmt_arr)
    assignment_count = self.ordered(user_asgmts(1)).length
    first_day = self.ordered(user_asgmts(1)).last.og_date
    last_day = self.ordered(user_asgmts(1)).first.og_date
    semester_length = (last_day - first_day).to_i
    return (assignment_count.to_f / semester_length.to_f).ceil
  end

  def self.no_empty_days()
    schedule = self.date_grouped(self.user_asgmts(1))
    check_day = schedule.keys.first + 1
    last_day = schedule.keys.last + 1

    # outer loop - go through the entire semester
    until check_day == last_day
      # reset empty days array for refill
      empty_days = []
      until schedule[check_day] && schedule[check_day].length > 0
        empty_days << check_day
        check_day += 1
      end

      # backfill empty days
      if empty_days.length >= schedule[check_day].length
        # if empty days outnumber asgmts, move them back 1/day as far as possible
        i = 0
        while i < schedule[check_day].length
          schedule[empty_days[i]] = []
          schedule[check_day][0].adj_date = empty_days[i]
          schedule[empty_days[i]] << schedule[check_day].shift
          i += 1
        end
        check_day == last_day - 1 ? nil : check_day = empty_days[0] - 2
      elsif empty_days[0]
        puts "Spreading asgmts out evenly from #{check_day} back through #{empty_days[0]}"
        # if asgmts outnumber empty days, spread them out roughly evenly
        # set up empty days to avoid overwriting later
        empty_days.each { |day| schedule[day] = [] }
        # 1 asgmt from og day to each empty day
        # loop back to beginning of empty days when you hit the end
        # stop once og day asgmts = # of loops made + 1
        stop_ctr = 1
        while schedule[check_day].length > stop_ctr
          i = 0
          back_day = -1
          while i < empty_days.length && schedule[check_day].length > stop_ctr
            schedule[check_day][0].adj_date = empty_days[back_day]
            schedule[empty_days[back_day]] << schedule[check_day].shift
            back_day -= 1
            i += 1
          end
          stop_ctr += 1
        end
      end
      # start looking for next schedule gap
      check_day += 1
    end

    return schedule.sort.to_h
  end

  # THE sorting algorithm to spread out assignments
  def self.flattened()
    # once all days have something, spread those out evenly as possible
  end

  def self.test_output()
    # self.ordered(user_asgmts(1))
    # self.date_grouped(user_asgmts(1))
    self.no_empty_days()
  end

  # may use or not use this in actuality; does need to be applied somewhere to filter JSON
  def serializer
    asgmt.slice(:description, :og_date, :adj_date, :course_id)
  end
end
