class Assignment < ApplicationRecord
  belongs_to :course
  delegate :user, :to => :course, :allow_nil => false

  def self.user_assgs(user_id)
    # rewrite this once user auth is ready
    self.all.find_all { |a| a.course.user.id == 1 }
  end

  def self.ordered
    byebug
    self.user_assgs(1).order(og_date: :desc)
  end

  def self.date_grouped
    flat_list = self.ordered
  end
end
