class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :amount
      t.string :message
      t.belongs_to :item, foreign_key: true

      t.timestamps
    end
  end
end
