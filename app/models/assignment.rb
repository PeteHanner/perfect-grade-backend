# frozen_string_literal: true

class Assignment < ApplicationRecord
  belongs_to :course
  delegate :user, to: :course, allow_nil: false

  def self.user_assgs(_user_id)
    all.filter { |a| a.user.id == 1 }
  end

  def self.ordered
    user_assgs(1).sort_by(&:adj_date).reverse
  end

  def self.date_grouped
    flat_list = ordered
    grouped_list = {}
    flat_list.map do |a|
      if grouped_list[a.adj_date]
        grouped_list[a.adj_date] << a.slice(:description, :og_date, :adj_date, :course_id)
      else
        grouped_list[a.adj_date] = []
        grouped_list[a.adj_date] << a.slice(:description, :og_date, :adj_date, :course_id)
      end
    end

    grouped_list
  end
end
