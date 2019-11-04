class AssignmentsController < ApplicationController
  def index
    render json: Assignment.test_output
  end
end

def og_flattened
  schedule.each do |check_day, asgmt_arr|
    if asgmt_arr.length == 0
      schedule.delete(check_day)
    elsif check_day == schedule.keys[-1]
      nil
    else
      if asgmt_arr.length > avg
        prev_day = check_day - 1
        if schedule[prev_day].length < avg
          if asgmt_arr.length > avg + 1
            while asgmt_arr.length > avg + 1
              schedule[check_day][0].adj_date = prev_day
              schedule[prev_day] << schedule[check_day].shift
            end
          else
            schedule[check_day][0].adj_date = prev_day
            schedule[prev_day] << schedule[check_day].shift
          end
        elsif schedule[prev_day].length == avg
          if asgmt_arr.length > avg + 1
            while asgmt_arr.length > avg + 1
              schedule[check_day][0].adj_date = prev_day
              schedule[prev_day] << schedule[check_day].shift
            end
          end
        end
      end
    end
  end
end