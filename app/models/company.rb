class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def freebies_collection; freebies end

  def devs_collection; devs end

  def give_freebie dev, item_name, value
    Freebie.create item_name: item_name, value: value, company: self, dev: dev
  end

  def oldest_company
    Company.find_by_founding_year(Company.minimum(:founding_year))
  end
end
