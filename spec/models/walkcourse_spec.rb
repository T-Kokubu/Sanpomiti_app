require 'rails_helper'

RSpec.describe Walkcourse, type: :model do
  describe 'titleについて' do
    it '規定文字数の入力があれば有効' do
    end
    it '入力がなければエラー表示する' do
    end
    it '規定文字数を超える入力はエラー表示' do
    end
  end

  describe 'descriptionについて' do
    it '規定文字数の入力があれば有効' do
    end
    it '入力がなければエラー表示する' do
    end
    it '規定文字数を超える入力はエラー表示' do
    end
  end

  describe 'time_to_first_spot' do
    it '整数の入力は有効になる' do
    end
    it '入力がない場合でも有効' do
    end
    it '整数以外の入力はエラー表示する' do
    end
    it '規定文字数を超える入力はエラー表示' do
    end
  end

  describe 'start_station' do
    it '規定文字数内の入力は有効になる' do
    end
    it '規定文字数を超える入力はエラー' do
    end
  end

  describe 'goal_station' do
    it '規定文字数内の入力は有効になる' do
    end
    it '規定文字数を超える入力はエラー' do
    end
  end
end
