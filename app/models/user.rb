class User < ApplicationRecord
  before_save :assign_token

  def assign_token
    self.token = SecureRandom.hex 
  end
end
