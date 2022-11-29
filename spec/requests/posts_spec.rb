require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/posts/index'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/posts/index'
      expect(response).to render_template('index')
    end

    it 'contains the correct heading' do
      get '/posts/index'
      expect(response.body).to include('Post List')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/show/posts/show'
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get '/users/show/posts/show'
      expect(response).to render_template('show')
    end

    it 'contains the correct heading' do
      get '/users/show/posts/show'
      expect(response.body).to include('Single Post Details Page')
    end
  end
end
