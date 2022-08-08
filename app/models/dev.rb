class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def freebies_collection; freebies end

  def companies_collection; companies end

  def received_one? item_name
    freebies.exists? item_name: item_name
  end

  def give_away dev_instance, freebie_instance
    # If giving dev owns freebie
    if freebies.exists? item_name: freebie_instance
      # Replace freebie dev from giver_dev to receiving_dev
      item = freebies.where(item_name: freebie_instance).first
      item.update dev: dev_instance
    else
      "Giver dev doesn't have that freebie 😢"
    end
  end
end
