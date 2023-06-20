require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before :each do
      get '/users/1/posts'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it ' does not render a different template' do
      expect(response).to_not render_template(:show)
    end

    it 'shows the correct placeholder text' do
      expect(response.body).to include('List of Posts for specific User')
    end
  end

  describe 'GET /posts/:id' do
    before :each do
      get '/users/1/posts/21'
    end
  end
end
