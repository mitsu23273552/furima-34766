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
    validates :category_id, numericality: { other_than: 1 } 
    validates :price, numericality: {
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9999999
    }
    validates :item_quality_id, numericality: { other_than: 1 } 
    validates :delivery_fee_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :delivery_day_id, numericality: { other_than: 1 } 
  end
end
