require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) { create(:user) }

  describe '#create' do
    context '正当な情報が入力された場合' do
      before do
        post :create, params: { session: {
          email: user.email,
          password: user.password,
      } }
      end
      it 'ログイン後、userページに遷移すること' do
        expect(response).to redirect_to user_path(user)
      end
    end

    context '誤った情報が入力された場合' do
      before do
        post :create, params: { session: {
        email: user.email,
        password: '99999999999',
      } }
      end
      it 'newページへレンダリングすること' do
        expect(response).to render_template :new
      end
    end
  end

  describe '#destroy' do
    before do
      delete :destroy, params: { session: {
        email: user.email,
        password: user.password,
    } }
    end
    context 'Sessionの削除' do
      it '削除した後、ルートページにリダイレクトすること' do
        expect(response).to redirect_to root_path
      end
    end
  end
end
