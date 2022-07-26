class Subscription < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :price, :status, :frequency, :tea_name, :user_id
  validates_numericality_of :price

  enum status: {
    "inactive" => 0,
    "active" => 1
  }

  enum frequency: {
    "weekly" => 0,
    "bi-weekly" => 1,
    "monthly" => 2
  }
end
