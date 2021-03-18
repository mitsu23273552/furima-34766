class ToAddress < ApplicationRecord
  belongs_to :rop

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
    end
  end
end
