class Accounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :email
      t.string :hashed_password
      t.string :salt
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :last_login_at
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end