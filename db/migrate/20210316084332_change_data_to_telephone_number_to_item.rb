class ChangeDataToTelephoneNumberToItem < ActiveRecord::Migration[6.0]
  def change
    change_column :to_addresses, :to_telephone_number, :string
  end
end
