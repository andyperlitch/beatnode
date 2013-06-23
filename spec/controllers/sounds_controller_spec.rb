require 'spec_helper'

describe SoundsController, :signed_in do
  describe '#show' do
    let(:sound) { create(:sound) }

    it 'assigns @sound' do
      get :show, id: sound.id
      expect(assigns[:sound]).to eq(sound)
    end

    it 'returns 404 if sound isnt found' do
      get :show, id: 123
      expect(response.status).to be(404)
    end
  end
end
