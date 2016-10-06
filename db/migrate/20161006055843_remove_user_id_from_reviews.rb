class RemoveUserIdFromReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :user_id
  end

  def up
    remove_column :reviews, :user_id, :integer
  end
end
