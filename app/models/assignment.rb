class Assignment < ApplicationRecord
  belongs_to :course
  # Find all user assignments
  def self.user_asgmts(id)
    User.find(id).assignments.sort_by(&:og_date)
  end


  # Spread step 1: backfill empty days


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

  # Return date-grouped, spread-out assignments

end
