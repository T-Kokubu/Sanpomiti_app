require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # ログインしていないユーザーの挙動
  describe 'not_logged_in user' do
    # showページ
    describe "#show" do
      context 'refers to show_page' do
        before do
          @user = create(:user)
        end
        it "redirects to sign_in page" do
          get :show, params: {id: @user.id}
          expect(response.status).to eq 302
        end
      end
    end

    describe "new" do
      it 'responds successfully' do
        expect(response.status).to eq 200
      end
    end

    # describe "create" do
    # end
    #
    # describe "edit" do
    #
    # end
    #
    # describe "update" do
    #
    # end

  end

  # ログインユーザーの挙動
  describe "ログインユーザーの挙動について" do
    before :each do
      @user = create(:user)
      sign_in @user
    end

    describe "#show" do
      before do
        get :show, params: {id: @user.id}
      end
      context "ログインユーザーがshow_pageを参照した場合" do
        it "正しく反応すること" do
          expect(response).to be_successful
        end
        it "show_pageを表示すること" do
          expect(response.status).to eq 200
        end
        it "@userに要求されたユーザーを割り当てること" do
          expect(assigns(:user)).to eq @user
        end
        it ":showテンプレートを表示すること" do
          expect(response).to render_template :show
        end
      end
    end

    describe "new" do
      before do
        get :new
      end
      it "正しく反応すること" do
        expect(response.status).to eq 200
      end
      it "@userに要求されたユーザーを割り当てること" do
        expect(assigns(:user)).to be_a_new(User)
      end
      it ":newテンプレートを表示すること" do
        expect(response).to render_template :new
      end
    end



    describe "edit" do
      before do
        get :edit, params: {id: @user.id}
      end
      it "正しく反応すること" do
        expect(response.status).to eq 200
      end
      it "@userに要求されたユーザーと合致すること" do
        expect(assigns(:user)).to eq @user
      end
      it ":editテンプレートを表示すること" do
        expect(response).to render_template :edit
      end
    end

    describe "create" do
      before do
        @user = attributes_for(:user)
      end
      it "正しく反応すること" do
        expect(response.status).to eq 200
      end
      it 'データベースに新しいユーザーが登録されること' do
        expect{
          post :create, user: @user
        }.to change(User, :count).by(1)
      end
      it 'rootにリダイレクトすること' do
        expect(response).to redirect_to user_path(@user)
      end
    end
  end
end
