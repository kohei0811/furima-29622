require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameと,email, password, password_confirmation, last_name, first_name, last_name_kana,first_name_kana, date_of_birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で登録できる' do
        @user.password = 'aaa123'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '生年月日が空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む6文字以上である必要があります')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email は@を含む必要があります')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'asd12'
        @user.password_confirmation = 'asd12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角ひらがな・カタカナ・漢字である必要があります')
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角ひらがな・カタカナ・漢字である必要があります')
      end
      it 'last_name_kanaが全角（カタカナ）でないと登録できない' do
        @user.last_name_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カタカナである必要があります')
      end
      it 'first_name_kanaが全角（カタカナ）でないと登録できない' do
        @user.first_name_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カタカナである必要があります')
      end
    end
  end
end