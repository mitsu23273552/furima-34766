class CreateToAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :to_addresses do |t|
      t.references :rop,              foreign_key: true
      t.string :to_postal_code,       null: false
      t.integer :prefecture_id,       null: false
      t.string :to_city,              null: false
      t.string :to_address1,          null: false
      t.string :to_address2
      t.string :to_telephone_number,  null: false
      t.timestamps
    end
  end
end
