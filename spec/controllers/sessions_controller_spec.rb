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

    it 'finds the user from an auth object' do
      User.should_receive(:find_or_create_from_auth).
        with(kind_of(Auth::Soundcloud)).
        and_return(user)

      post :create, provider: 'soundcloud'
    end

    it 'signs in the user' do
      post :create, provider: 'soundcloud'
      expect(session[:user_id]).to be(user.id)
    end

    it 'sets viewer' do
      expect {
        post :create, provider: 'soundcloud'
      }.to change { viewer }.from(nil).to(user)
    end

    it 'responds 201 created' do
      post :create, provider: 'soundcloud'
      expect(response.status).to be(201)
    end
  end

  describe '#destroy', :signed_in do
    it 'signs out the user' do
      expect {
        delete :destroy
      }.to change { session[:user_id] }.from(viewer.id).to(nil)
    end

    it 'responds 204 no content' do
      delete :destroy
      expect(response.status).to be(204)
    end
  end
end
