class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :art_id
      t.text :content
      t.text :name

      t.timestamps
    end
  end
end
