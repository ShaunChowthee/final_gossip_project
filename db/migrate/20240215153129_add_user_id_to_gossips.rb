class AddUserIdToGossips < ActiveRecord::Migration[7.1]
  def change
    add_reference :gossips, :user, null: false, index: true
  end
end
