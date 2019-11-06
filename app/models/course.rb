class Course < ApplicationRecord
  belongs_to :user
  has_many :assignments

  def self.date_grouped(courses)
    courses.map do |course|
      course.assignments.transform_values do |a|
        a.slice(:description, :og_date, :adj_date, :course_id)
      end
    end
  end
end
