require 'rails_helper'

RSpec.describe Spot, type: :model do
  let!(:user) { create(:user) }
  let!(:walkcourse) { create(:walkcourse, user: user) }
  let!(:spot) { create(:spot, walkcourse: walkcourse) }

  it '規定文字数の入力があれば有効' do
    expect(spot).to be_valid
  end

  describe 'name' do
    it '規定文字数を超える入力はエラー' do
      spot = build(:spot, name: 'a' * 21)
      spot.valid?
      expect(spot.errors[:name]).to include('は20文字以内で入力してください')
    end
  end
  describe 'address' do
    it '規定文字数を超える入力はエラー' do
      spot = build(:spot, address: 'a' * 31)
      spot.valid?
      expect(spot.errors[:address]).to include('は30文字以内で入力してください')
    end
  end
  describe 'description' do
    it '規定文字数を超える入力はエラー' do
      spot = build(:spot, description: 'a' * 251)
      spot.valid?
      expect(spot.errors[:description]).to include('は250文字以内で入力してください')
    end
  end
  describe 'transit_time' do
    it '入力がない場合でも有効' do
      spot = build(:spot, transit_time: '', walkcourse: walkcourse)
      expect(spot).to be_valid
    end
    it '規定文字数を超える入力はエラー' do
      spot = build(:spot, transit_time: '1' * 4)
      spot.valid?
      expect(spot.errors[:transit_time]).to include('は3文字以内で入力してください')
    end
    it '整数以外の入力はエラー表示する' do
      spot = build(:spot, transit_time: '/[^0-9]/', walkcourse: walkcourse)
      spot.valid?
      expect(spot.errors[:transit_time]).to include('は数値で入力してください')
    end
  end
  describe 'time_required' do
    it '入力がない場合でも有効' do
      spot = build(:spot, time_required: '', walkcourse: walkcourse)
      expect(spot).to be_valid
    end
    it '規定文字数を超える入力はエラー' do
      spot = build(:spot, time_required: '1' * 4)
      spot.valid?
      expect(spot.errors[:time_required]).to include('は3文字以内で入力してください')
    end
    it '整数以外の入力はエラー表示する' do
      spot = build(:spot, time_required: '/[^0-9]/', walkcourse: walkcourse)
      spot.valid?
      expect(spot.errors[:time_required]).to include('は数値で入力してください')
    end
  end
end
