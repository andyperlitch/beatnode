require 'spec_helper'

describe SessionsController do
  let(:user) { create(:user) }

  describe '#new' do
    it 'is successful' do
      get :new
      expect(response).to be_success
    end
  end

  describe '#create' do
    let(:auth_hash) { Fixture(:soundcloud_auth) }

    before do
      User.stub(:find_or_create_from_auth) { user }
      request.env['omniauth.auth'] = auth_hash
    end

    it 'signs in the user' do
      post :create, provider: 'soundcloud'
      expect(session[:user_id]).to be(user.user_id)
    end
  end
end
