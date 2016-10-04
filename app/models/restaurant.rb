#ONly code talking to database should be in models
class Restaurant < ActiveRecord::Base

  validates :name, length: { minimum: 3 }
end
