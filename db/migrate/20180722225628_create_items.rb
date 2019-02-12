class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :category
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end

