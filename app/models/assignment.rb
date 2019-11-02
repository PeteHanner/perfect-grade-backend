# frozen_string_literal: true

class Assignment < ApplicationRecord
  belongs_to :course
  # delegate :user, to: :course, allow_nil: false

  # find all assignments for active user
  # # TODO: personalize once skateboard is up & auth implemented
  def self.user_asgmts(_user_id)
    current_user = User.find(1)
    current_user.assignments
  end

  # get all user assignments in date order starting from back
  # # TODO: make this more flexible once the algorithm is working
  # (so this method can be used before & after flattening)
  def self.ordered(asgmt_arr)
    # byebug
    asgmt_arr.sort_by(&:adj_date).reverse
  end

  # create hash to store arrays of date-grouped assignments
  # # TODO: syllabi list due date, so push all dates back by one for 'work' date
  def self.date_grouped(asgmt_arr)
    flat_list = ordered(asgmt_arr)
    grouped_list = {}
    flat_list.each do |a|
      if grouped_list[a.adj_date]
        grouped_list[a.adj_date] << a
      else
        grouped_list[a.adj_date] = []
        grouped_list[a.adj_date] << a
      end
    end
    grouped_list
  end

  # calculate average number of assignments per day, rounding up
  def self.avg_per_day(_asgmt_arr)
    assignment_count = ordered(user_asgmts(1)).length
    first_day = ordered(user_asgmts(1)).last.og_date
    last_day = ordered(user_asgmts(1)).first.og_date
    semester_length = (last_day - first_day).to_i
    (assignment_count.to_f / semester_length.to_f).ceil
  end

  def self.no_empty_days
    # NO EMPTY DAYS FORMULA:
    # find first empty day in the semester
    # place in working array
    # check next day
    #   if empty/nonexistent, add to working array
    #   repeat until you find a day with asgmt(s)
    #     if empty days >= # of asgmts:
    #       move 1 asgmt to each empty day starting earliest until none left
    #     if empty day < # of asgmts:
    #       while current og day asgmts > prev day asgmts && # of moves < total asgmts
    #         move one asgmt back to each day earliest -> latest
    #         start with earliest day again once last empty day is reached
    #   find next empty day in semester and repeat all of the above
    #   keep going until you hit last day of semester
  end

  # THE sorting algorithm to spread out assignments
  def self.flattened
    # once all days have something, spread those out evenly as possible
  end

  def self.test_output
    # self.ordered(user_asgmts(1))
    # self.date_grouped(user_asgmts(1))
    date_grouped(no_empty_days)
  end

  # may use or not use this in actuality; does need to be applied somewhere
  # to filter JSON
  def serializer
    asgmt.slice(:description, :og_date, :adj_date, :course_id)
  end
end
