class Review < ActiveRecord::Base
  validates :rating, inclusion: (1..5)
  validates :user, uniqueness: { scope: :restaurant, message: "had reviewed this restaurant already" }
  belongs_to :user
  belongs_to :restaurant
end
