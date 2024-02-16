class CreateGossips < ActiveRecord::Migration[7.1]
  def change
    create_table :gossips do |t|
      t.string :author
      t.string :content

      t.timestamps
    end
  end
end
