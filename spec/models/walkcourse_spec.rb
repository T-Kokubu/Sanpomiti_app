require 'rails_helper'

RSpec.describe Walkcourse, type: :model do
  let!(:user) { create(:user) }
  let!(:walkcourse) { create(:walkcourse, user: user) }

  describe 'titleについて' do
    it '入力がなければエラー表示する' do
      walkcourse = build(:walkcourse, title: '')
      walkcourse.valid?
      expect(walkcourse.errors[:title]).to include('を入力してください')
    end
    it '規定文字数を超える入力はエラー表示' do
      walkcourse = build(:walkcourse, title: 'a' * 51)
      walkcourse.valid?
      expect(walkcourse.errors[:title]).to include('は50文字以内で入力してください')
    end
  end

  describe 'descriptionについて' do
    it '入力がなければエラー表示する' do
      walkcourse = build(:walkcourse, description: '')
      walkcourse.valid?
      expect(walkcourse.errors[:description]).to include('を入力してください')
    end
    it '規定文字数を超える入力はエラー表示' do
      walkcourse = build(:walkcourse, description: 'a' * 256)
      walkcourse.valid?
      expect(walkcourse.errors[:description]).to include('は255文字以内で入力してください')
    end
  end

  describe 'coursepicについて' do
    it '入力がなければエラー表示する' do
      walkcourse = build(:walkcourse, coursepic: '')
      walkcourse.valid?
      expect(walkcourse.errors[:coursepic]).to include('を入力してください')
    end
  end

  describe 'time_to_first_spot' do
    it '入力がない場合でも有効' do
      walkcourse = build(:walkcourse, time_to_first_spot: '', user: user)
      expect(walkcourse).to be_valid
    end
    it '整数以外の入力はエラー表示する' do
      walkcourse = build(:walkcourse, time_to_first_spot: '/[^0-9]/', user: user)
      walkcourse.valid?
      expect(walkcourse.errors[:time_to_first_spot]).to include('は数値で入力してください')
    end
  end

  describe 'start_station' do
    it '規定文字数を超える入力はエラー' do
      walkcourse = build(:walkcourse, start_station: 'a' * 21)
      walkcourse.valid?
      expect(walkcourse.errors[:start_station]).to include('は20文字以内で入力してください')
    end
  end

  describe 'goal_station' do
    it '規定文字数を超える入力はエラー' do
      walkcourse = build(:walkcourse, goal_station: 'a' * 21)
      walkcourse.valid?
      expect(walkcourse.errors[:goal_station]).to include('は20文字以内で入力してください')
    end
  end

  it '規定文字数の入力があれば有効' do
    expect(walkcourse).to be_valid
  end
end
