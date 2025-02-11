require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる' do
      it '必要のある情報が全て入力されている' do
        expect(@user).to be_valid
      end
    end
  end

  describe '新規登録ができない' do
    context '新規登録できない' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it '名字（全角）が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '名前（全角）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '名字（カナ）が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it '名前（カナ）が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'パスワードとパスワード（確認）が一致していないと登録できない' do
        @user.password = 'a1b2c3'
        @user.password_confirmation = 'a1b2c3d4'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードが６文字未満だと登録できない' do
        @user.password = 'h1g34'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは半角英数字混合でないと登録できない' do
        @user.password = 'sjjdne'
        @user.password_confirmation = 'sjjdne'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'パスワードが英字のみでは登録できない' do
        @user.password = 'testsample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'パスワードが数字のみでは登録できない' do
        @user.password = '114514'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードに全角文字が含まれていると登録できない' do
        @user.password = 'jdy78あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        second_user = FactoryBot.build(:user)
        second_user.email = @user.email
        second_user.valid?
        expect(second_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスに＠が含まれていないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '名字（全角）が全角でないと登録できない' do
        @user.last_name = 'ｱaｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end

      it '名前（全角）が全角でないと登録できない' do
        @user.first_name = 'ｱｱｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end

      it '名字（カナ）が全角でないと登録できない' do
        @user.last_name = 'ｱあｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end

      it '名前（カナ）が全角でないと登録できない' do
        @user.last_name = 'ｱあｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
    end
  end
end
