# frozen_string_literal: true

class Assignment < ApplicationRecord
  belongs_to :course
  delegate :user, to: :course, allow_nil: false

  # find all assignments for active user
  # # TODO: personalize once skateboard is up & auth implemented
  def self.user_assgs(_user_id)
    return self.all.filter { |a| a.user.id == 1 }
  end

  # get all user assignments in date order starting from back
  def self.ordered
    return user_assgs(1).sort_by(&:adj_date).reverse
  end

  # create hash to store arrays of date-grouped assignments
  # # TODO: syllabi list due date, so push all dates back by one for 'work' date
  def self.date_grouped
    flat_list = self.ordered
    grouped_list = {}
    flat_list.map do |a|
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
  def self.avg_per_day
    assignment_count = self.ordered.length
    first_day = self.ordered.last.og_date
    last_day = self.ordered.first.og_date
    semester_length = (last_day - first_day).to_i
    return (assignment_count.to_f / semester_length.to_f).ceil
  end

  # THE sorting algorithm to spread out assignments
  def self.flattened
    avg = self.avg_per_day()
    schedule = self.date_grouped()

    # activeDay = first schedule pair (last day with assignments)
    # moveDay = active day - 1

    # first, spread evenly acorss
  end
end
