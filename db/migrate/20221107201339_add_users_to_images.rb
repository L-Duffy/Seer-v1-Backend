class AddUsersToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :user_id, :integer
  end
end
