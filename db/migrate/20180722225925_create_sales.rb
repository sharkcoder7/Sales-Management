class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :deal, foreign_key: true

      t.timestamps
    end
  end
end
