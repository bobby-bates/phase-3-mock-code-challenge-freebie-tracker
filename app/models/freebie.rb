class Freebie < ActiveRecord::Base
  belongs_to :dev
  belongs_to :company

  # Naming this method #dev made self.dev recursively call itself instead of
  # returning the Dev instance, so it's called dev_instance now
  def dev_instance
    self.dev
  end

  def company_instance
    self.company
  end
end
