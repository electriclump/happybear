require 'rails_helper'

RSpec.describe EntriesController, type: :controller do

  let(:valid_params) do
    { entry: { name: 'Dave', message: 'really nice site' } }
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns http redirect' do
      post :create, params: valid_params
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'DELETE #destroy' do
    let(:entry) { create :entry }

    it 'returns http redirect' do
      delete :destroy, params: { id: entry.id }
      expect(response).to have_http_status(:redirect)
    end
  end
end
