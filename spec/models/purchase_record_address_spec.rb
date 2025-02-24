require 'rails_helper'
#purchase_record_address_spec.rb
RSpec.describe PurchaseRecordAddress, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }
  
  before do
    @purchase_record_address = FactoryBot.build(:purchase_record_address, 
      user_id: user.id, 
      item_id: item.id
    )
  end

  describe '商品購記録の保存' do

    context '内容に問題ない場合' do
      it 'すべての情報が適切に入力されていれば保存できる' do
        expect(@purchase_record_address).to be_valid
      end
      it '建物名がなくても保存できる' do
        @purchase_record_address.building_name = ''
        expect(@purchase_record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @purchase_record_address.postal_code = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が空だと保存できない' do
        @purchase_record_address.prefecture_id = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @purchase_record_address.city = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @purchase_record_address.house_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @purchase_record_address.phone_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'トークンが空だと保存できない' do
        @purchase_record_address.token = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号はハイフンが含まれていないと保存できない' do
        @purchase_record_address.postal_code = '1234567'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Postal code must be in format '###-####'")
      end
      it '郵便番号はハイフン前の桁が３桁未満だと保存できない' do
        @purchase_record_address.postal_code = '12-3457'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Postal code must be in format '###-####'")
      end
      it '郵便番号はハイフン前の桁が4桁以上だと保存できない' do
        @purchase_record_address.postal_code = '1233-3567'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Postal code must be in format '###-####'")
      end
      it '郵便番号はハイフン後の桁が4桁未満だと保存できない' do
        @purchase_record_address.postal_code = '132-357'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Postal code must be in format '###-####'")
      end
      it '郵便番号はハイフン後の桁が5桁以上だと保存できない' do
        @purchase_record_address.postal_code = '123-35647'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Postal code must be in format '###-####'")
      end
      it '郵便番号は全角数字が含まれていると保存できない' do
        @purchase_record_address.postal_code = '1３3-4567'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Postal code must be in format '###-####'")
      end
      it '電話番号は、10桁未満だと保存できない' do
        @purchase_record_address.phone_number = '183773423'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid. Input only number with 10 to 11 digits")
      end
      it '電話番号は、12桁以上だと保存できない' do
        @purchase_record_address.phone_number = '183773423356'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid. Input only number with 10 to 11 digits")
      end
      it '電話番号は、全角数字が含まれていると保存できない' do
        @purchase_record_address.phone_number = '18377３42335'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid. Input only number with 10 to 11 digits")
      end
      it '電話番号は、ハイフンが含まれていると保存できない' do
        @purchase_record_address.phone_number = '183-7743-2335'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid. Input only number with 10 to 11 digits")
      end
      it 'userが紐付いていないと保存できない' do
        @purchase_record_address.user_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @purchase_record_address.item_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end