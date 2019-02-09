class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.integer :price
      t.integer :amount
      t.datetime :begin
      t.datetime :end
      t.string :message
      t.belongs_to :item, foreign_key: true
      t.belongs_to :store, foreign_key: true

      t.timestamps
    end
  end
end
