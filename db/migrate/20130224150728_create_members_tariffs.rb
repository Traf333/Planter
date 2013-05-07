class CreateMembersTariffs < ActiveRecord::Migration
  def up
    create_table :member_tariffs do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

  end

  def down
  end
end
