require 'rails_helper'

RSpec.describe Prefecture, type: :model do
  let!(:prefecture) { create(:prefecture) }

  describe 'prefectureに関するテスト' do
    it '入力がなければエラー表示' do
      prefecture = build(:prefecture, name: '')
      expect(prefecture).to be_invalid
    end
    it '正常な入力があれば有効' do
      expect(prefecture).to be_valid
    end
  end
end
