class AddContactsToUser < ActiveRecord::Migration
  def change

    add_column :users, :skype, :string
    add_column :users, :icq, :string

  end
end
