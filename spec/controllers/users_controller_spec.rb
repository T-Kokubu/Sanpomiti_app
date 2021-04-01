require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # ログインしていないユーザーの挙動
  describe 'not_logged_in user' do
    describe '#show' do
      context 'show_pageを参照しようとする場合' do
        before do
          @user = create(:user)
        end
        it 'リダイレクトすること' do
          get :show, params: { id: @user.id }
          expect(response.status).to eq 302
        end
      end

      context '要求されたユーザーが存在しない場合' do
        it 'リクエストはRecordNotFoundとなること' do
          expect{
            get :show, params: { id: 99_999 }
          }.to raise_exception(ActiveRecord::RecordNotFound)
        end
      end
    end

    describe 'new' do
      it '正しく反応すること' do
        expect(response.status).to eq 200
      end
    end

    describe 'update' do
      context '要求されたユーザーが存在しない場合' do
        it 'リクエストはRecordNotFoundとなること' do
          expect  do
            patch :update, params: { id: 99_999, user: attributes_for(:user, name: 'hogehoge') }
          end.to raise_exception(ActiveRecord::RecordNotFound)
        end
      end
    end
  end

  # ログインユーザーの挙動
  describe 'ログインユーザーの挙動について' do
    before :each do
      @user = create(:user)
      sign_in @user
    end

    describe '#show' do
      before do
        get :show, params: { id: @user.id }
      end
      context 'ログインユーザーがshow_pageを参照した場合' do
        it '正しく反応すること' do
          expect(response).to be_successful
        end
        it 'show_pageを表示すること' do
          expect(response.status).to eq 200
        end
        it '@userに要求されたユーザーを割り当てること' do
          expect(assigns(:user)).to eq @user
        end
        it ':showテンプレートを表示すること' do
          expect(response).to render_template :show
        end
      end
    end

    describe 'new' do
      before do
        get :new
      end
      it '正しく反応すること' do
        expect(response.status).to eq 200
      end
      it '@userに要求されたユーザーを割り当てること' do
        expect(assigns(:user)).to be_a_new(User)
      end
      it ':newテンプレートを表示すること' do
        expect(response).to render_template :new
      end
    end

    describe 'edit' do
      before do
        get :edit, params: { id: @user.id }
      end
      it '正しく反応すること' do
        expect(response.status).to eq 200
      end
      it '@userに要求されたユーザーと合致すること' do
        expect(assigns(:user)).to eq @user
      end
      it ':editテンプレートを表示すること' do
        expect(response).to render_template :edit
      end
    end

    describe 'create' do
      let!(:prefecture) { create(:prefecture) }

      it '正しく反応すること' do
        # `post :create`と書くことで「UsersControllerのcreateアクションに対してpostする。」が発生します。
        # attributes_forでは関連先のprefectureまで生成してくれないので、mergeする必要がある。
        post :create, params: { user: attributes_for(:user).merge(prefecture_id: prefecture.id) }
        expect(response.status).to eq 302
      end
      it 'データベースに新しいユーザーが登録されること' do
        expect do
          post :create, params: { user: attributes_for(:user).merge(prefecture_id: prefecture.id) }
        end.to change(User, :count).by(1)
      end
      it 'show_pageにリダイレクトすること' do
        post :create, params: { user: attributes_for(:user).merge(prefecture_id: @user.prefecture.id) }
        expect(response).to redirect_to user_path(User.last)
      end

      context '無効なパラメータの場合' do
        it 'リクエストは200 OKとなること' do
          post :create, params: { id: 99_999, user: attributes_for(:user) }
          expect(response.status).to eq 200
        end
        it 'データベースに新しいユーザーが登録されないこと' do
          expect do
            post :create, params: { id: 99_999, user: attributes_for(:user) }
          end.not_to change(User, :count)
        end
        it ':newテンプレートを再表示すること' do
          post :create, params: { id: 99_999, user: attributes_for(:user) }
          expect(response).to render_template :new
        end
      end
    end

    describe 'Patch #update' do
      context '存在するユーザーの場合' do
        context '有効なパラメータを送信したとき' do
          before do
            patch :update, params: { id: @user.id, user: attributes_for(:user, name: 'hogehoge') }
          end
          it 'リダイレクトすること' do
            expect(response.status).to eq 302
          end
          it 'データベースのユーザーが更新されること' do
            @user.reload
            expect(@user.name).to eq 'hogehoge'
          end
          it 'users#showにリダイレクトすること' do
            expect(response).to redirect_to user_path(@user)
          end
        end
      end
    end

    context '無効なパラメータの場合' do
      before do
        patch :update, params: { id: @user.id, user: attributes_for(:user, name: ' ') }
        @original_name = @user.name
      end
      it '正しく反応すること' do
        expect(response.status).to eq 200
      end
      it 'データベースのユーザーは更新されないこと' do
        @user.reload
        expect(@user.name).to eq @original_name
      end
      it 'editテンプレートを再表示すること' do
        expect(response).to render_template :edit
      end
    end
  end
end
