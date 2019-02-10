class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.decimal :price, :precision => 8, :scale => 2
      t.text :name
      t.text :message
      t.integer :user_id
      t.integer :item_id
      t.belongs_to :item, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end

