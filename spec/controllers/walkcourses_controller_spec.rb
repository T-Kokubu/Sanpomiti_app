require 'rails_helper'

RSpec.describe WalkcoursesController, type: :controller do
  describe '#index' do
    it '正常なレスポンスであること' do
    end
    it '200レスポンスを返すこと' do
    end
  end

  describe '#new' do
    context 'loginuserの場合' do
      it '正常なレスポンスであること' do
      end
      it '200レスポンスを返すこと' do
      end
    end

    context 'loginしていない場合' do
      it '正常なレスポンスではないこと' do
      end
      it '302レスポンスを返すこと' do
      end
      it 'ログイン画面にリダイレクトされること' do
      end
    end
  end

  describe '#create' do
    context 'loginuserの場合' do
      it '正常にWalkcourseを作成できること' do
      end
      it 'Walkcourse作成後、editページに遷移すること' do
      end
    end

    context '不正なデータを含むWalkcourseの場合' do
      it '不正なデータを含むWalkcourseは作成できなくなっていること' do
      end
      it '不正なWalkcourseを作成しようとすると、再度作成ページへリダイレクトされること' do
      end
    end

    context 'loginしていない場合' do
      it '正常なレスポンスではないこと' do
      end
      it '302レスポンスを返すこと' do
      end
      it 'ログイン画面にリダイレクトされること' do
      end
    end
  end

  describe '#show' do
    it '正常なレスポンスであること' do
    end
    it '200レスポンスを返すこと' do
    end
  end

  describe '#edit' do
    context 'loginuserの場合' do
      it '正常なレスポンスであること' do
      end
      it '200レスポンスを返すこと' do
      end
    end

    context 'loginしていない場合' do
      it '正常なレスポンスではないこと' do
      end
      it '302レスポンスを返すこと' do
      end
      it 'ログイン画面にリダイレクトされること' do
      end
    end

    context '他のユーザーがあるユーザーのWalkcourseを編集しようとした時' do
      it '正常なレスポンスが返らないこと' do
      end
      it '他のユーザーのWalkcourseを編集しようとするとルートページにリダイレクトすること' do
      end
    end
  end

  describe '#update' do
    context 'loginuserの場合' do
      it '正常に更新できること' do
      end
      it '更新した後Walkcourseの詳細ページにリダイレクトすること' do
      end
    end

    context 'loginしていない場合' do
      it '正常なレスポンスではないこと' do
      end
      it '302レスポンスを返すこと' do
      end
      it 'ログイン画面にリダイレクトされること' do
      end
    end

    context '不正なデータを含むWalkcourseの場合' do
      it '不正なデータを含むWalkcourseを更新できなくなっていること' do
      end
      it '不正なWalkcourseを作成しようとすると、再度編集ページへリダイレクトすること' do
      end
    end

    context '他のユーザーがあるユーザーのWalkcourseを更新しようとした時' do
      it '正常なレスポンスが返らないこと' do
      end
      it '他のユーザーのWalkcourseを編集しようとするとルートページにリダイレクトされること' do
      end
    end
  end

  describe '#destroy' do
    context 'loginuserの場合' do
      it '正常に削除できること' do
      end
      it '更新した後ルートページにリダイレクトすること' do
      end
    end

    context 'loginしていない場合' do
      it '正常なレスポンスではないこと' do
      end
      it '302レスポンスを返すこと' do
      end
      it 'ログイン画面にリダイレクトされること' do
      end
    end

    context '他のユーザーのWalkcourseを削除しようとした時' do
      it '他のユーザーのWalkcourseを削除しようとしても削除できないこと' do
      end
      it '他のユーザーのWalkcourseを削除しようとするとルートページにリダイレクトされること' do
      end
    end
  end
end
