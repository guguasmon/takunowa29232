require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'uid,nickname,name,imageが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'profileが空でも登録できる' do
        @user.profile = ''
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'uidが空だと登録できない' do
        @user.uid = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Uid can't be blank")
      end
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空だと登録できない' do
        @user.image = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
