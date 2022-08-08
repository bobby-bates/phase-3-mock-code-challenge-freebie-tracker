class Freebie < ActiveRecord::Base
  belongs_to :dev
  belongs_to :company

  # Naming this method #dev made (self.)dev recursively call itself instead of
  # returning the Dev instance, so it's called dev_instance now
  # NOTE: Same issue with any other object association method
  def dev_instance; dev end

  def company_instance; company end

  def print_details
    "#{dev.name} owns a #{item_name} from #{company.name}"
  end
end
