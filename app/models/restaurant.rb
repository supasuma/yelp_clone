#ONly code talking to database should be in models
class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
end
