require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を出品できる' do
      it '必要な情報が全て適切に入力されていると出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できない' do
      it 'ユーザーが存在していないと出品できない' do
        item = FactoryBot.build(:item, user: nil)
        item.valid?
        expect(item.errors.full_messages).to include('User must exist')
      end

      it '画像が空だと出品できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が空だと出品できない' do
        @item.summary = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Summary can't be blank")
      end

      it 'カテゴリーの情報が空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態の情報が空だと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担の情報が空だと出品できない' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end

      it '発送元の地域の情報が空だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数の情報が空だと出品できない' do
        @item.date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Date can't be blank")
      end

      it '価格の情報が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '商品名が40字を超えると出品できない' do
        @item.item_name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name 商品名は40字までです')
      end

      it '商品の説明が1000字を超えると出品できない' do
        @item.summary = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Summary 商品の説明は1000字までです')
      end

      it '価格は半角数字でないと出品できない' do
        @item.price = 'あsでっw'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 半角数字のみを使用してください')
      end

      it '価格が9_999_999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300から¥9,999,999までです')
      end

      it '価格が300円未満では出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300から¥9,999,999までです')
      end
    end
  end
end
