class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def freebies_collection
    self.freebies
  end

  def devs_collection
    self.devs
  end
end
