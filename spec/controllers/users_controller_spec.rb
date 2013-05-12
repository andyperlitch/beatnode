require 'spec_helper'

describe UsersController, :signed_in do
  let(:user) { create(:user) }
  let(:sound) { create(:sound, uploader: user) }

  describe '#show' do
    it 'is successful' do
      get :show, id: user.id
      expect(response).to be_success
    end

    it 'assigns @user' do
      get :show, id: user.id
      expect(assigns[:user]).to eq(user)
    end

    it 'assigns @uploaded_sounds' do
      sound
      get :show, id: user.id
      expect(assigns[:uploaded_sounds]).to include(sound)
    end

    it 'returns 404 if the user isnt found' do
      get :show, id: 123
      expect(response.status).to be(404)
    end
  end
end
