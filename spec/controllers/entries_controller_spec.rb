require 'rails_helper'

RSpec.describe EntriesController, type: :controller do

  let(:valid_params) { { entry: { name: 'Dave', message: 'really nice site' } } }

  describe 'POST #create' do
    it 'returns http redirect' do
      post :create, params: valid_params
      expect(response).to have_http_status(:redirect)
    end
  end

end
