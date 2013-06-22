require 'spec_helper'

describe UsersController, :signed_in do
  let(:user) { create(:user) }

  describe '#show' do
    it 'assigns @user' do
      get :show, id: user.id
      expect(assigns[:user]).to eq(user)
    end

    it 'assigns @uploaded_sounds' do
      sound = create(:upload, user: user).sound
      get :show, id: user.id
      expect(assigns[:uploaded_sounds]).to include(sound)
    end

    it 'returns 404 if the user isnt found' do
      get :show, id: 123
      expect(response.status).to be(404)
    end
  end
end
