require 'rails_helper'

RSpec.describe RopToAddress, type: :model do
  describe '購入記録' do
    before do
      user = FactoryBot.create(:user)
      image = fixture_file_upload('/files/test_image.png')
      item = FactoryBot.create(:item, image: image)
      sleep 3
      @rop_to_address = FactoryBot.build(:rop_to_address, user_id: user.id, item_id: item.id)
    end

    context '登録に成功' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@rop_to_address).to be_valid
      end

      it 'to_address2は空でも保存できること' do
        @rop_to_address.to_address2 = nil
        expect(@rop_to_address).to be_valid
      end
    end

    context '登録に失敗' do
      it 'userが紐付いていないと保存できないこと' do
        @rop_to_address.user_id = nil
        @rop_to_address.valid?
        expect(@rop_to_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @rop_to_address.item_id = nil
        @rop_to_address.valid?
        expect(@rop_to_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空だと保存できないこと' do
        @rop_to_address.token = nil
        @rop_to_address.valid?
        expect(@rop_to_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'to_postal_codeが空だと保存できないこと' do
        @rop_to_address.to_postal_code = nil
        @rop_to_address.valid?
        expect(@rop_to_address.errors.full_messages).to include("To postal code can't be blank")
      end
      it 'to_postal_codeがハイフンを含んだ正しい形式でないと保存できないこと' do
        @rop_to_address.to_postal_code = '1234567'
        @rop_to_address.valid?
        expect(@rop_to_address.errors.full_messages).to include('To postal code is invalid. Include hyphen(-)')
      end

      it 'prefectureを選択していないと保存できないこと' do
        @rop_to_address.prefecture_id = 1
        @rop_to_address.valid?
        expect(@rop_to_address.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'to_cityが空だと保存できないこと' do
        @rop_to_address.to_city = nil
        @rop_to_address.valid?
        expect(@rop_to_address.errors.full_messages).to include("To city can't be blank")
      end

      it 'to_address1が空だと保存できないこと' do
        @rop_to_address.to_address1 = nil
        @rop_to_address.valid?
        expect(@rop_to_address.errors.full_messages).to include("To address1 can't be blank")
      end

      it 'to_telephone_numberが空だと保存できないこと' do
        @rop_to_address.to_telephone_number = nil
        @rop_to_address.valid?
        expect(@rop_to_address.errors.full_messages).to include("To telephone number can't be blank")
      end
      it 'to_telephone_numberが全角数字だと保存できないこと' do
        @rop_to_address.to_telephone_number = '０９０１２３４５６７８'
        @rop_to_address.valid?
        expect(@rop_to_address.errors.full_messages).to include('To telephone number is invalid')
      end
      it 'to_telephone_numberが半角英数字混合だと保存できないこと' do
        @rop_to_address.to_telephone_number = '090abcd5678'
        @rop_to_address.valid?
        expect(@rop_to_address.errors.full_messages).to include('To telephone number is invalid')
      end
      it 'to_telephone_numberが半角英字だと保存できないこと' do
        @rop_to_address.to_telephone_number = 'abcdefghij'
        @rop_to_address.valid?
        expect(@rop_to_address.errors.full_messages).to include('To telephone number is invalid')
      end
      it 'to_telephone_numberが12桁以上だと保存できないこと' do
        @rop_to_address.to_telephone_number = '090123456789'
        @rop_to_address.valid?
        expect(@rop_to_address.errors.full_messages).to include('To telephone number is too long (maximum is 11 characters)')
      end
    end
  end
end
