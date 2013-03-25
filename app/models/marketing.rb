# -*- encoding : utf-8 -*-
class Marketing < ActiveRecord::Base
  attr_accessible :email

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |marketing|
        csv << marketing.attributes.values_at(*column_names)
      end
    end
  end
end
