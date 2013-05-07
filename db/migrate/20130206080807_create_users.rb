class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :surname
      t.string :phone
      t.string :address
      t.string :email
      t.string :site

      t.timestamps
    end
  end
end
