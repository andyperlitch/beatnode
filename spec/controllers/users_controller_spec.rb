require 'spec_helper'

describe UsersController, :signed_in do
  let(:user) { create(:user) }

  describe '#show' do
    it 'provides user data' do
      get :show, id: user.id
      expect(json_response['username']).to eq(user.username)
    end

    it 'provides upload data' do
      upload = create(:upload, user: user)
      get :show, id: user.id
      expect(json_response['uploaded_sounds']).to eq([upload.sound_id])
    end
  end
end
