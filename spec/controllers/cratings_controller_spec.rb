require 'spec_helper'

describe CratingsController, :signed_in do
  describe '#create' do
    let(:node)   { create(:node) }
    let(:params) { {crating: {node_id: node.id}} }

    it 'adds a node to the crate' do
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
