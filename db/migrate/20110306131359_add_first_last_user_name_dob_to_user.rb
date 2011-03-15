class AddFirstLastUserNameDobToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string, :null => false, :default => ''
    add_column :users, :last_name, :string, :null => false, :default => ''
    add_column :users, :user_name, :string, :null => false, :default => ''
    add_column :users, :date_of_birth, :date, :null => false, :default => '01/01/1900'
    add_index :users, :user_name, :unique => true
  end

  def self.down
    remove_index :users, :user_name
    remove_column :users, :date_of_birth
    remove_column :users, :user_name
    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end
