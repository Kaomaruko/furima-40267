require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目の入力が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
    it "nicknameが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailが重複していると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに＠が付いてないと登録できない" do
      @user.email = "aaaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できない' do
      @user.password = 'aaa00'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end


    it "passwordは半角英字がなければ登録できない" do
      @user.password = '11111111'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordに半角数字がなければ登録できない' do
      @user.password = 'aaaaaaaa'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordは半角でなければ登録できない' do
      @user.password = 'あああ１１１'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationが一致しなければ登録できない' do
      @user.password = 'aaa000'
      @user.password_confirmation = 'aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "last_nameが空だと登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_nameが空だと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが全角入力でないと登録できない" do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end

    it "first_nameが全角入力でないと登録できない" do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end

    it "last_nameのフリガナが空では登録できない" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "nameのフリガナが空だと登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_nameのフリガナがカタカナ入力でないと登録できない" do
      @user.last_name_kana = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
    end

    it "first_nameのフリガナがカタカナ入力でないと登録できない" do
      @user.first_name_kana = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end

    it "birthdayが空白だと登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end



end    
end