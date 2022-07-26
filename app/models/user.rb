class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :shipping_address
  validates_uniqueness_of :email
  has_many :subscriptions
end
