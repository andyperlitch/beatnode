require 'spec_helper'

describe CollaborationsController, :signed_in do
  describe '#create' do
    let(:followed) { create(:user) }
    let(:back)     { root_path }
    let(:params)   { {collaboration: {subject_id: followed.id}} }

    before do
      request.env['HTTP_REFERER'] = back
    end

    it 'creates a collaboration' do
      expect do
        post :create, params
      end.to change(Collaboration, :count).by(1)
    end

    it 'prevents mass assignment of source_id' do
      other = create(:user)
      post :create, params.merge(source_id: other.id)
      expect(Collaboration.first.source).to eq(viewer)
    end

    it 'redirects back' do
      post :create, params
      expect(response).to redirect_to(back)
    end
  end
end
