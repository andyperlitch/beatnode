require 'spec_helper'

describe CollaborationsController, :signed_in do
  describe '#create' do
    let(:followed) { create(:user) }
    let(:params)   { {collaboration: {subject_id: followed.id}} }

    it 'creates a Collaboration' do
      expect do
        post :create, params
      end.to change(Collaboration, :count).by(1)
    end

    it 'prevents mass assignment of source_id' do
      other = create(:user)
      post :create, params.merge(source_id: other.id)
      expect(Collaboration.first.source).to eq(viewer)
    end

    it 'responds 201 created' do
      post :create, params
      expect(response.status).to be(201)
    end
  end
end
