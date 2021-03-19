require 'rails_helper'
RSpec.describe User, type: :model do
  describe "#create" do
    before do
      @user = FactoryBot.build(:user)
    end
    
    it "全ての項目が入力されていれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空だと登録できないこと" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空だと登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailに@がない場合は登録できないこと" do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "emailが重複している場合は登録できないこと" do
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(@user.errors.full_messages).to include("has already been taken")
    end

    it "passwordとpassword_confirmationが空だと登録できないこと" do
      @user.password = ""
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordとpassowrd_confirmationが６文字以上であれば登録できること" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user).to be_valid
    end

    it "passwordとpassword_confirmationが半角英数字混合されていれば登録できること" do
      @user.password = "aaa123"
      @user.password_confirmation = "aaa123"
      expect(@user).to be_valid
    end

    it "passwordとpassword_confirmationが一致していない場合は登録できないこと" do
      @user.password = "aaa123"
      @user.password_confirmation = "abc321"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameが空だと登録できないこと" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空だと登録できないこと" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_name_kanaが空だと登録できないこと" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_name_kanaが空だと登録できないこと" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "birth_dayが空だと登録できないこと" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

    #ユーザー名全角・カタカナ

    it "first_nameが全角(漢字・ひらがな・カタカナ)でなければ登録できないこと" do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_nameが全角(漢字・ひらがな・カタカナ)でなければ登録できないこと" do
      @user.last_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "first_name_kanaが全角カタカナでなければ登録できないこと" do
      @user.first_name_kana = "ぜんかく"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "last_name_kanaが全角カタカナでなければ登録できないこと" do
      @user.last_name_kana = "ぜんかく"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
  end
end