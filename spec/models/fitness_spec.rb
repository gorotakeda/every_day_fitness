require 'rails_helper'

RSpec.describe Fitness, type: :model do
  before do
    @fitness = FactoryBot.build(:fitness)
  end

  describe '新規投稿の保存' do
    context '新規投稿が保存できる場合 ' do
      it '全ての情報が正しく入力されていれば保存できること' do
        expect(@fitness).to be_valid
      end
    end
    context '新規投稿ができない場合' do
      it 'titleが空では保存できないこと' do
        @fitness.title = ''
        @fitness.valid?
        expect(@fitness.errors.full_messages).to include("Title can't be blank")
      end
      it 'infoが空では保存できないこと' do
        @fitness.info = ''
        @fitness.valid?
        expect(@fitness.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idが0では保存できないこと' do
        @fitness.category_id = '0'
        @fitness.valid?
        expect(@fitness.errors.full_messages).to include('Category must be other than 0')
      end
      it 'level_idが0では保存できなこと' do
        @fitness.level_id = '0'
        @fitness.valid?
        expect(@fitness.errors.full_messages).to include('Level must be other than 0')
      end
      it 'userが紐付いていないと保存できないこと' do
        @fitness.user = nil
        @fitness.valid?
        expect(@fitness.errors.full_messages).to include('User must exist')
      end
    end
  end
end
