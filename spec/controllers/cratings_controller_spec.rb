require 'spec_helper'

describe CratingsController, :signed_in do
  describe '#create' do
    let(:sound)  { create(:sound) }
    let(:params) { {crating: {sound_id: sound.id}} }

    it 'creates a Crating' do
      expect {
        post :create, params
      }.to change(Crating, :count).by(1)
    end

    it 'adds a sound to the crate' do
      expect {
        post :create, params
      }.to change { viewer.reload.crate.count }.by(1)
    end

    it 'responds 201 created' do
      post :create, params
      expect(response.status).to be(201)
    end
  end
end
