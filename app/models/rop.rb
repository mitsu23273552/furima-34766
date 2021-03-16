class Rop < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :to_address
end
