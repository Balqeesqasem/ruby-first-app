class CreateFrinds < ActiveRecord::Migration[6.0]
  def change
    create_table :frinds do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
