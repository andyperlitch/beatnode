require 'spec_helper'

describe UsersController, :signed_in do
  let(:user) { create(:user) }

  describe '#show' do
    it 'is successful' do
      get :show, id: user.id
      expect(response).to be_success
    end
  end
end
