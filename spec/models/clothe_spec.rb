require 'rails_helper'

RSpec.describe Clothe, type: :model do
    describe 'clothe登録' do
      before do
        user = FactoryBot.create(:user)
        @clothe = FactoryBot.build(:clothe, user_id: user.id)
      end
  
      context 'clotheが登録できるとき' do
  
        it '全て入力があれば登録できる' do
          expect(@clothe).to be_valid
        end
      end
      
      context 'clotheが登録できないとき' do
        
        it '画像が空では登録できない' do
          @clothe.image = nil
          @clothe.valid?
          expect(@clothe.errors.full_messages).to include("Image can't be blank")
        end
  
        it '説明が空では登録できない' do
          @clothe.description = ''
          @clothe.valid?
          expect(@clothe.errors.full_messages).to include("Description can't be blank")
        end
  
        it 'カテゴリーが0では登録できない' do
          @clothe.category_id = 0
          @clothe.valid?
          expect(@clothe.errors.full_messages).to include("Category must be other than 0")
        end
      end
    end
end
