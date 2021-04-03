# require 'rails_helper'
#
# # 正常にレスポンスを返すこと
# RSpec.describe HomeController, type: :controller do
#   describe "#index" do
# # 正常にレスポンスを返すこと it "responds successfully" do
#     get :index
#           expect(response).to be_success
#     end
#   end
# end
#
# RSpec.describe SessionsController, type: :controller do
#   include LoginHelper
#
#   let(:user) { FactoryBot.create(:user, name: 'michael') }
#
#   it "get new" do
#     get :new
#     expect(response.status).to eq(200)
#   end
#
#   it "store forwarding_url only at first" do
#     redirect_to edit_user_path(user)
#     expect(session[:forwarding_url]).not_to eq(edit_user_url(user))
#     log_in_as(user)
#     expect(session[:forwarding_url]).to be_nil
#   end
# end
