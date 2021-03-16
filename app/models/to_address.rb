class ToAddress < ApplicationRecord
  belongs_to :rop

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :to_postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :to_city
    validates :to_address1
    validates :to_telephone_number, format: { with: /\A[0-9]+$\z/ }, length: { maximum: 11 }

    with_options numericality: { other_than: 1 } do
      validates :prefecture_id
    end
  end
end
