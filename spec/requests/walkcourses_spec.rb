require 'rails_helper'

RSpec.describe 'Walkcourses', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/walkcourses/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/walkcourses/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/walkcourses/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/walkcourses/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/walkcourses/destroy'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/walkcourses/show'
      expect(response).to have_http_status(:success)
    end
  end
end
