class Assignment < ApplicationRecord
  belongs_to :course

  # Calculate average assignments per day
  def self.avg_per_day(user_id)
    asgs = User.find(user_id).assignments.sort_by(&:og_date)
    asg_count = asgs.length
    date_difference = asgs.last.og_date - asgs.first.og_date
    avg = (asg_count.to_f/date_difference.to_f).ceil
  end

  # Group a flat array of assignments together by date
  # asgmts => group of Assignment objects; date_field => og or adj date, depending on use
  def self.date_grouped(asgmts, date_field)
    grouped_list = {}
    asgmts.each do | asgmt |
      if grouped_list[asgmt[date_field]]
        grouped_list[asgmt[date_field]] << asgmt
      else
        grouped_list[asgmt[date_field]] = []
        grouped_list[asgmt[date_field]] << asgmt
      end
    end
    grouped_list
  end

  # Flatten step 1: backfill empty days
  def self.no_empty_days(asgs)
    asgs = asgs.sort_by(&:og_date)
    first_day = asgs.first.og_date
    last_day = asgs.last.og_date
    check_day = first_day
    agenda = self.date_grouped(asgs, :og_date)

    while check_day < last_day
      # find group of empty_days until day has something
      # break this loop once end of semester is found
      empty_days = []
      until (agenda[check_day] && agenda[check_day].length > 0) || (check_day >= last_day)
        empty_days << check_day
        check_day += 1
      end

      if empty_days.length > 0
        if empty_days.length >= agenda[check_day].length # more empty days than assignments
          # 1 assignment per day from beginning
          i = 0
          while agenda[check_day].length > 0
            agenda[empty_days[i]] = []
            agenda[empty_days[i]] << agenda[check_day].shift
            i += 1
          end
          # set check day back to previously empty day
          check_day = empty_days[0]
        else # more assignments than empty days
          # set up empty days to avoid overwriting later
          empty_days.each { |day| agenda[day] = [] }
          # 1 asgmt from og day to each empty day
          # loop back to beginning of empty days when you hit the end
          # stop once og day asgmts = # of loops made + 1
          stop_ctr = 1
          while agenda[check_day].length > stop_ctr
            i = 0
            back_day = -1
            while i < empty_days.length && agenda[check_day].length > stop_ctr
              agenda[empty_days[back_day]] << agenda[check_day].shift
              back_day -= 1
              i += 1
            end
            stop_ctr += 1
          end
          check_day = empty_days[0]
        end
      end
      check_day += 1
    end

    return agenda
  end


  # Flatten step 2: spread out assignments evenly as possible
  def self.level_adjust(date_grouped_hash)
    date_range = date_grouped_hash.keys.sort
    puts date_range
    check_day = date_range.last
    first_day = date_range.first
    avg = self.avg_per_day(1) # # TODO: take out user ID hardcoding

    until check_day == first_day
      check_day -= 1 until date_grouped_hash[check_day]
      if date_grouped_hash[check_day].length > avg
        prev_day = check_day - 1
        puts check_day
        while date_grouped_hash[check_day].length > avg
          date_grouped_hash[prev_day] << date_grouped_hash[check_day].shift
        end
      end
      check_day -= 1
    end
    date_grouped_hash
  end

  # Flatten step 3: actually update db using the hash
  def self.reassign_days(date_grouped_hash)
    date_grouped_hash.each do |date, asg_arr|
      asg_arr.each do |asg|
        # minus one from adj date bc you actually DO an asgmt 1 day prior to due date
        Assignment.find(asg.id).update(adj_date: (date - 1))
      end
    end
  end


  # Higher-level method called to actually do the flattening
  def self.flatten(asgmt_arr)
    step_one = self.no_empty_days(asgmt_arr)
    step_two = self.level_adjust(step_one)
    step_three = self.reassign_days(step_two)
  end
end
