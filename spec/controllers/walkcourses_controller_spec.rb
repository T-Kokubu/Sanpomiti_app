require 'rails_helper'

RSpec.describe WalkcoursesController, type: :controller do

  let!(:user) { create(:user) }
  let!(:anotheruser) { create(:anotheruser) }
  let!(:walkcourse) { create(:walkcourse, user: user) }

  describe '#index' do
    it '正常なレスポンスであること' do
      get :index
      expect(response).to be_success
    end
    it '200レスポンスを返すこと' do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe '#new' do
    context 'loginuserの場合' do
      before :each do
        @user = create(:user)
        sign_in @user
      end

      it '正常なレスポンスであること' do
        get :new
        expect(response).to be_success
      end
      it '200レスポンスを返すこと' do
        get :new
        expect(response).to have_http_status "200"
      end
    end

    context 'loginしていない場合' do
      it '正常なレスポンスではないこと' do
        get :new
        expect(response).to_not be_success
      end
      it '302レスポンスを返すこと' do
        get :new
        expect(response).to have_http_status "302"
      end
      it 'ログイン画面にリダイレクトされること' do
        get :new
        expect(response).to redirect_to "/login"
      end
    end
  end

  describe '#create' do
    context 'loginuserの場合' do
      before :each do
        @user = create(:user)
        sign_in @user
      end
      it '正常にWalkcourseを作成できること' do
        expect do
          post :create, params: { walkcourse: attributes_for(:walkcourse) }
        end.to change(Walkcourse, :count).by(1)
      end
      it 'Walkcourse作成後、editページに遷移すること' do
        post :create, params: { walkcourse: attributes_for(:walkcourse) }
        expect(response).to redirect_to edit_walkcourse_path(Walkcourse.last)
      end
    end

    context '不正なデータを含むWalkcourseの場合' do
      before :each do
        sign_in user

      end
      it '不正なデータを含むWalkcourseは作成できなくなっていること' do
        #####################################
        expect do
          post :create, params: { walkcourse: attributes_for(:walkcourse, title: nil) }
        end.not_to change(Walkcourse, :count)
      end
      it '不正なWalkcourseを作成しようとすると、再度作成ページへレンダリングされること' do
        post :create, params: { walkcourse: attributes_for(:walkcourse, title: nil) }
        expect(response).to render_template :new
      end
    end

    context 'loginしていない場合' do
      it '正常なレスポンスではないこと' do
        post :create, params: { walkcourse: attributes_for(:walkcourse) }
        expect(response).to_not be_success
      end
      it '302レスポンスを返すこと' do
        post :create, params: { walkcourse: attributes_for(:walkcourse) }
        expect(response).to have_http_status "302"
      end
      it 'ログイン画面にリダイレクトされること' do
        post :create, params: { walkcourse: attributes_for(:walkcourse) }
        expect(response).to redirect_to "/login"
      end
    end
  end

  describe '#show' do
    it '正常なレスポンスであること' do
      get :show, params: {id: walkcourse.id}
      expect(response).to be_success
    end
    it '200レスポンスを返すこと' do
      get :show, params: {id: walkcourse.id}
      expect(response).to have_http_status "200"
    end
  end

  describe '#edit' do
    context 'loginuserの場合' do
      before :each do
        @user = create(:user)
        sign_in @user
      end
      let!(:walkcourse) { create(:walkcourse, user: @user)}
      it '正常なレスポンスであること' do
        get :edit, params: {id: walkcourse.id}
        expect(response).to be_success
      end
      it '200レスポンスを返すこと' do
        get :edit, params: {id: walkcourse.id}
        expect(response).to have_http_status "200"
      end
    end

    #############################################
    context 'loginしていない場合' do
      it '正常なレスポンスではないこと' do
        get :edit, params: {id: walkcourse.id}
        expect(response).to_not be_success
      end
      it '302レスポンスを返すこと' do
        get :edit, params: {id: walkcourse.id}
        expect(response).to have_http_status "302"
      end
      it 'ログイン画面にリダイレクトされること' do
        get :edit, params: {id: walkcourse.id}
        expect(response).to redirect_to "/login"
      end
    end

    context '他のユーザーのWalkcourseを編集しようとした時' do
      before :each do
        sign_in user
      end
      it '正常なレスポンスが返らないこと' do
        get :edit, params: {id: walkcourse.id}
        expect(response).to_not be_success
      end
      it '他のユーザーのWalkcourseを編集しようとするとルートページにリダイレクトすること' do
        sign_in anotheruser
        get :edit, params: {id: walkcourse.id}
        expect(response).to redirect_to root_url
      end
    end
  end

  describe '#update' do
    context 'loginuserの場合' do
      before :each do
        sign_in user
        patch :update, params: { id:walkcourse.id, walkcourse: attributes_for(:walkcourse, title: 'hogehoge') }
      end
      it '正常に更新できること' do
        expect(walkcourse.reload.title).to eq 'hogehoge'
      end
      it '更新した後Walkcourseの詳細ページにリダイレクトすること' do
        expect(response).to redirect_to walkcourse_path(walkcourse)
      end
    end

    context 'loginしていない場合' do
      before :each do
        patch :update, params: { id:walkcourse.id, walkcourse: attributes_for(:walkcourse, title: 'hogehoge') }
      end
      it '正常なレスポンスではないこと' do
        expect(response).to_not be_success
      end
      it '302レスポンスを返すこと' do
        expect(response).to have_http_status "302"
      end
      it 'ログイン画面にリダイレクトされること' do
        expect(response).to redirect_to "/login"
      end
    end

    context '不正なデータを含むWalkcourseの場合' do
      before :each do
        sign_in user
        patch :update, params: { id:walkcourse.id, walkcourse: attributes_for(:walkcourse, title: 'a' * 51) }
      end
      it '不正なデータを含むWalkcourseを更新できなくなっていること' do
        expect(walkcourse.reload.title).not_to eq 'a' * 51
      end
      it '不正なWalkcourseを作成しようとすると、ルートページへリダイレクトすること' do
        expect(response).to render_template :edit
      end
    end

    context '他のユーザーのWalkcourseを更新しようとした時' do
      before :each do
        sign_in anotheruser
        patch :update, params: { id:walkcourse.id, walkcourse: attributes_for(:walkcourse, title: 'hogehoge') }
      end
      it '正常なレスポンスが返らないこと' do
        expect(response).not_to be_success
      end
      it '他のユーザーのWalkcourseを編集しようとするとルートページにリダイレクトされること' do
        expect(response).to redirect_to root_url
      end
    end
  end

  describe '#destroy' do
    context 'loginuserの場合' do
      before :each do
        sign_in user
        delete :destroy, params: {id: walkcourse.id}
      end
      it '正常に削除できること' do
        ###############################
        expect(response).to change(user.walkcourses, :count).by(-1)
      end
      it '更新した後ルートページにリダイレクトすること' do
        expect(response).to redirect_to root_url
      end
    end

    context 'loginしていない場合' do
      it '302レスポンスを返すこと' do
        delete :destroy, params: {id: walkcourse.id}
        expect(response).to have_http_status "302"
      end
      it 'ログイン画面にリダイレクトされること' do
        delete :destroy, params: {id: walkcourse.id}
        expect(response).to redirect_to "/login"
      end
    end

    context '他のユーザーのWalkcourseを削除しようとした時' do
      before :each do
        sign_in anotheruser
      end
      it '他のユーザーのWalkcourseを削除しようとしても削除できないこと' do
        #############################################
        delete :destroy, params: {id: walkcourse.id}
        expect(response).to_not change(user.walkcourses, :count)
      end
      it '他のユーザーのWalkcourseを削除しようとするとrefererルートページにリダイレクトされること' do
        #############################################
        delete :destroy, params: {id: walkcourse.id}
        expect(response).to redirect_to root_url
      end
    end
  end
end
