class AddUserIdToFrinds < ActiveRecord::Migration[6.0]
  def change
    add_column :frinds, :user_id, :integer
    add_index :frinds, :user_id
  end
end
