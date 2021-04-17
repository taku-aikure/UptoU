require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'clothe登録' do
    before do
      user = FactoryBot.create(:user)
      @post = FactoryBot.build(:post, user_id: user.id)
    end

    context 'postが登録できるとき' do

      it '全て入力があれば登録できる' do
        expect(@post).to be_valid
      end
    end
    
    context 'postが登録できないとき' do
      
      it '画像が空では登録できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end

      it '詳細が空では登録できない' do
        @post.detail = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Detail can't be blank")
      end

      it 'seasonが1では登録できない' do
        @post.season_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Season must be other than 1")
      end
    end
  end
end
