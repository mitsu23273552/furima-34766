class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  def was_attached?
    self.image.attached?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_quality
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  with_options presence: true do
    validates :title
    validates :item_comment
    validates :image
    validates :price, numericality: {
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9999999,
      only_integer: true
    }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_quality_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :delivery_day_id
    end
  end
end
