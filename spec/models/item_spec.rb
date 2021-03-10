require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("/files/test_image.png")
    end

    context '登録に成功' do
      it 'title、item_comment、category_id、price、item_quality_id、delivery_fee_id、prefecture_id、delivery_day_idが存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '登録に失敗' do
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it '商品名が入力されていないと保存できないこと' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品説明が入力されていないと保存できないこと' do
        @item.item_comment = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item comment can't be blank")
      end

      it 'カテゴリーが選択されていないと保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態が選択されていないと保存できないこと' do
        @item.item_quality_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item quality must be other than 1")
      end

      it '配送料が選択されていないと保存できないこと' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end

      it '発送元の地域が選択されていないと保存できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '発送までの日数が選択されていないと保存できないこと' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end

      it '価格が入力されていないと保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が半角数字以外だと保存できないこと' do
        @item.price = 'テスト'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '数値が小数を含むと保存できないこと' do
        @item.price = '500.5'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end

      it '価格が300円未満だと保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が9,999,999円より大きいと保存できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end

  end
end
