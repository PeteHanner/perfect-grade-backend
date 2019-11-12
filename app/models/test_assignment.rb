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









































def self.no_empty_days(asgs)
  asgs = asgs.order(:og_date)
  check_day = asgs.first.og_date + 1
  last_day = asgs.last.adj_date + 1
  grouped_asgs = self.date_grouped(asgs, :og_date)

  until check_day >= last_day
    # reset empty days array for refill
    empty_days = []
    until (grouped_asgs[check_day] && grouped_asgs[check_day].length > 0)
      empty_days << check_day
      check_day += 1
      check_day = last_day - 1 if check_day >= last_day
      puts check_day
    end

    # backfill empty days
    if empty_days.length >= grouped_asgs[check_day].length
      # if empty days outnumber asgmts, move them back 1/day as far as possible
      i = 0
      while i < grouped_asgs[check_day].length
        grouped_asgs[empty_days[i]] = []
        grouped_asgs[empty_days[i]] << grouped_asgs[check_day].shift
        i += 1
      end
      check_day = empty_days[0]
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
          grouped_asgs[empty_days[back_day]] << grouped_asgs[check_day].shift
          back_day -= 1
          i += 1
        end
        stop_ctr += 1
      end
    end
    # start looking for next grouped_asgs gap
    check_day += 1
    # puts check_day
    # check_day = last_day if check_day > last_day
  end
  grouped_asgs
end