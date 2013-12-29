class Employee < ActiveRecord::Base
  has_many :sales

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
