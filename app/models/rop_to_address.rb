class RopToAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :to_postal_code, :prefecture_id, :to_city, :to_address1, :to_address2, :to_telephone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :to_postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1}
    validates :to_city
    validates :to_address1
    validates :to_telephone_number, format: { with: /\A[0-9]+$\z/ }, length: { maximum: 11 }
  end
  

  def save
    rop = Rop.create(user_id: user_id, item_id: item_id)
    ToAddress.create(rop_id: rop.id, to_postal_code: to_postal_code, prefecture_id: prefecture_id, to_city: to_city, to_address1: to_address1, to_address2: to_address2, to_telephone_number: to_telephone_number)
  end
end