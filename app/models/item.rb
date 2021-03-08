class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  def was_attached?
    self.image.attached?
  end

  with_options presence: true do
    validates :title
    validates :item_comment
    validates :category_id
    validates :price
    validates :item_quality_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_day_id
  end
end
