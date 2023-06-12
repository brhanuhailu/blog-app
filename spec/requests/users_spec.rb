require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before :each do
      get '/users'
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
      expect(response.body).to include('List of All users')
    end
  end

  describe 'GET /users/:id' do
    before :each do
      get '/users/1'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it ' does not render a different template' do
      expect(response).to_not render_template(:index)
    end

    it 'shows the correct placeholder text' do
      expect(response.body).to include('Single user')
    end
  end
end
