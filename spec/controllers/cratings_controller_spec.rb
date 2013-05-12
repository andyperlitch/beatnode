require 'spec_helper'

describe CratingsController, :signed_in do
  describe '#create' do
    let(:sound)   { create(:sound) }
    let(:params) { {crating: {sound_id: sound.id}} }

    it 'adds a sound to the crate' do
      expect do
        post :create, params
      end.to change { viewer.reload.crate.count }.by(1)
    end

    it 'redirects back' do
      post :create, params
      expect(response).to redirect_to(back)
    end
  end
end
