require 'rails_helper'

RSpec.describe 'Users request', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template('index')
    end

    it 'contains the correct heading' do
      get '/users'
      expect(response.body).to include('Display Users List')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get '/users/show'
      expect(response).to render_template('show')
    end

    it 'contains the correct heading' do
      get '/users/show'
      expect(response.body).to include('Show single users details')
    end
  end
end
