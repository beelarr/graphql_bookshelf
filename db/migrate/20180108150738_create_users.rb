class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :street_number
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number
      t.string :email
      t.string :company
      t.string :password_digest
      t.boolean :is_superadmin

      t.timestamps
    end
  end
end
