class Subscription < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :price, :status, :frequency, :tea_name, :user_id
  validates_numericality_of :price, :status, :frequency
end
