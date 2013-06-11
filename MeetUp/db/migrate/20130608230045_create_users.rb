class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.string :gender
      t.string :country
      t.integer :zip

      t.timestamps
    end
  end
end
