require 'spec_helper'

describe UsersController, :signed_in do
  let(:user) { create(:user) }
  let(:node) { create(:node, uploader: user) }

  describe '#show' do
    it 'is successful' do
      get :show, id: user.user_id
      expect(response).to be_success
    end

    it 'assigns @user' do
      get :show, id: user.user_id
      expect(assigns[:user]).to eq(user)
    end

    it 'assigns @uploaded_nodes' do
      node
      get :show, id: user.user_id
      expect(assigns[:uploaded_nodes]).to include(node)
    end

    it 'returns 404 if the user isnt found' do
      get :show, id: 123
      expect(response.status).to be(404)
    end
  end
end
