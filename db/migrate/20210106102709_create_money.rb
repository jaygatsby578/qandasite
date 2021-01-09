class CreateMoney < ActiveRecord::Migration[6.0]
  def change
    create_table :money do |t|
      t.date :date
      t.text :item
      t.integer :price
      t.text :category
      t.text :memo

      t.timestamps
    end
  end
end
