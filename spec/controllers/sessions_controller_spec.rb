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

    it 'sets viewer' do
      expect do
        post :create, provider: 'soundcloud'
      end.to change { viewer }.from(nil).to(user)
    end

    it 'redirects to the home page' do
      post :create, provider: 'soundcloud'
      response.should redirect_to(root_path)
    end

    it 'redirects back' do
      request.env['HTTP_REFERER'] = '/a/path'
      post :create, provider: 'soundcloud'
      response.should redirect_to('/a/path')
    end
  end
end
