require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:anotheruser) { create(:anotheruser) }
  let!(:walkcourse) { create(:walkcourse, user: user) }
  let!(:otherwalkcourse) { create(:otherwalkcourse, user: user) }
  let(:favorite) { user.favorites.build(like_id: walkcourse.id) }
  let(:otherfavorite) { user.otherfavorites.build(like_id: otherwalkcourse.id) }

  describe '#index' do
    it '正常なレスポンスであること' do
      get :index
      expect(response).to be_successful
    end
    it '200レスポンスを返すこと' do
      get :index
      expect(response).to have_http_status '200'
    end
  end

  describe '#crete' do
    context 'loginuserの場合' do
      before do
        sign_in user
      end
      it 'current_userが正常にlikeできること' do
        # post favorites_path, params: { like_id: walkcourse.id }
        # expect { user.like(wallkcourse) }.to change(User.favorites, :count).by(1)

        expect do
          post favorites_path, params: { like_id: walkcourse.id }
        end.to change(Favorite, :count).by(1)
      end
    end

    context 'loginしていない場合' do
      it '正常なレスポンスではないこと' do
        post :create, params: { walkcourse: attributes_for(:walkcourse) }
        expect(response).to_not be_successful
      end
      it '302レスポンスを返すこと' do
        post :create, params: { walkcourse: attributes_for(:walkcourse) }
        expect(response).to have_http_status '302'
      end
      it 'ログイン画面にリダイレクトされること' do
        post :create, params: { walkcourse: attributes_for(:walkcourse) }
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe '#destroy' do
    context 'loginuserの場合' do
      it 'current_userが正常にlikeできること' do
      end
    end

    context 'loginしていない場合' do
      it '正常なレスポンスではないこと' do
        delete :destroy, params: { id: walkcourse.id }
        expect(response).to_not be_successful
      end
      it '302レスポンスを返すこと' do
        delete :destroy, params: { id: walkcourse.id }
        expect(response).to have_http_status '302'
      end
      it 'ログイン画面にリダイレクトされること' do
        delete :destroy, params: { id: walkcourse.id }
        expect(response).to redirect_to '/login'
      end
    end

  end


end
