class Assignment < ApplicationRecord
  belongs_to :course

  # Find all user assignments
  def self.user_asgmts(id)
    # # TODO: make this flexible once auth is implemented
    User.find(1).assignments.sort_by(&:og_date)
  end

  def self.avg_per_day
    asg_count = self.user_asgmts(1).length
    date_difference = self.user_asgmts(1).last.og_date - self.user_asgmts(1).first.og_date
    avg = (asg_count.to_f/date_difference.to_f).ceil
  end


  # Spread step 1: backfill empty days
  def self.no_empty_days
    asgs = self.user_asgmts(1)
    grouped_asgs = self.date_grouped(asgs, :adj_date)
  end


  # Spread step 2: spread out assignments evenly as possible


  # Group a flat array of assignments together by date
  # asgmts => group of Assignment objects; date_field => og or adj date, depending on use
  def self.date_grouped(asgmts, date_field)
    grouped_list = {}
    asgmts.map do | asgmt |
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
