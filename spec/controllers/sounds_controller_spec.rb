require 'spec_helper'

describe SoundsController, :signed_in do
  describe '#show' do
    let(:sound) { create(:sound) }

    it 'assigns @sound' do
      get :show, id: sound.id
      expect(assigns[:sound]).to eq(sound)
    end
  end
end
