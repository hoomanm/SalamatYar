class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true

      t.string :first_name
      t.string :last_name
      t.string :national_id
      t.date :birthdate
      t.integer :gender
      t.string :city
      t.text :address
      t.string :email

      t.timestamps
    end
  end
end
