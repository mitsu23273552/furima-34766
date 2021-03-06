class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,            foreign_key: true
      t.string  :title,              null: false
      t.text    :item_comment,       null: false
      t.integer :category_id,        null: false
      t.integer :price,              null: false
      t.integer :item_quality_id,    null: false
      t.integer :delivery_fee_id,    null: false
      t.integer :prefecture_id,      null: false
      t.integer :delivery_day_id,    null: false

      t.timestamps
    end
  end
end
