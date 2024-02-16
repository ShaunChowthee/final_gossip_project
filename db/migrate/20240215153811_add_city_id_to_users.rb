class AddCityIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :city, null: false, index: true
  end
end
