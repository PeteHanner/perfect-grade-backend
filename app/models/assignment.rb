class Assignment < ApplicationRecord
  belongs_to :course

  # Find all user assignments: flat array, sorted by non-modified due date
  # def self.user_asgmts(id)
  #   # # TODO: make this flexible once auth is implemented
  #   User.find(1).assignments.sort_by(&:og_date)
  # end

  # Calculate average assignments per day
  def self.avg_per_day(user_id)
    asgs = User.find(user_id).assignments.sort_by(&:og_date)
    asg_count = asgs.length
    date_difference = asgs.last.og_date - asgs.first.og_date
    avg = (asg_count.to_f/date_difference.to_f).ceil
  end

  # Flatten step 1: backfill empty days
  def self.no_empty_days(asgs)
    puts "Ordering assignments"
    asgs = asgs.order(:og_date)
    check_day = asgs.first.og_date + 1
    last_day = asgs.last.adj_date + 1
    puts "Grouping assignments"
    grouped_asgs = self.date_grouped(asgs, :og_date)
    # byebug

    until check_day == last_day
      # reset empty days array for refill
      puts check_day
      empty_days = []
      until grouped_asgs[check_day] && grouped_asgs[check_day].length > 0
        empty_days << check_day
        check_day += 1
      end

      # backfill empty days
      if empty_days.length >= grouped_asgs[check_day].length
        # if empty days outnumber asgmts, move them back 1/day as far as possible
        i = 0
        while i < grouped_asgs[check_day].length
          grouped_asgs[empty_days[i]] = []
          # grouped_asgs[check_day][0].adj_date = empty_days[i]
          grouped_asgs[empty_days[i]] << grouped_asgs[check_day].shift
          i += 1
        end
        check_day == last_day - 1 ? nil : check_day = empty_days[0] - 2
      elsif empty_days[0]
        # if asgmts outnumber empty days, spread them out roughly evenly
        # set up empty days to avoid overwriting later
        empty_days.each { |day| grouped_asgs[day] = [] }
        # 1 asgmt from og day to each empty day
        # loop back to beginning of empty days when you hit the end
        # stop once og day asgmts = # of loops made + 1
        stop_ctr = 1
        while grouped_asgs[check_day].length > stop_ctr
          i = 0
          back_day = -1
          while i < empty_days.length && grouped_asgs[check_day].length > stop_ctr
            # grouped_asgs[check_day][0].adj_date = empty_days[back_day]
            grouped_asgs[empty_days[back_day]] << grouped_asgs[check_day].shift
            back_day -= 1
            i += 1
          end
          stop_ctr += 1
        end
      end
      # start looking for next grouped_asgs gap
      check_day += 1
    end
    grouped_asgs
  end


  # Flatten step 2: spread out assignments evenly as possible
  def self.level_adjust(date_grouped_hash)
    date_range = date_grouped_hash.keys.sort
    check_day = date_range.last
    first_day = date_range.first
    avg = self.avg_per_day(1) # # TODO: take out user ID hardcoding

    puts "Starting Level adjust"
    until check_day == first_day
      check_day -= 1 until date_grouped_hash[check_day]
      if date_grouped_hash[check_day].length > avg
        prev_day = check_day - 1
        while date_grouped_hash[check_day].length > avg
          # date_grouped_hash[check_day][0].adj_date = prev_day
          date_grouped_hash[prev_day] << date_grouped_hash[check_day].shift
        end
      end
      check_day -= 1
    end
    puts "Done with level adjust"
    date_grouped_hash
  end

  # Flatten step 3: actually update db using the hash
  def self.reassign_days(date_grouped_hash)
    puts "reassigning days"
    date_grouped_hash.each do |date, asg_arr|
      asg_arr.each do |asg|
        # minus one from adj date bc you actually DO an asgmt 1 day prior to due date
        Assignment.find(asg.id).update(adj_date: (date - 1))
      end
    end
    puts "Done reassigning days"
  end


  # Higher-level method called to actually do the flattening
  def self.flatten(asgmt_arr)
    step_one = self.no_empty_days(asgmt_arr)
    step_two = self.level_adjust(step_one)
    step_three = self.reassign_days(step_two)
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
end
