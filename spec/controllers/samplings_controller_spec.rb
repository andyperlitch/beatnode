require 'spec_helper'

describe SamplingsController, :signed_in do
  let(:source) { create(:sound) }
  let(:result) { create(:sound, uploader: viewer) }

  describe '#create' do
    let(:params) do
      {sampling: {source_id: source.id, result_id: result.id}}
    end

    it 'creates a sampling' do
      expect do
        post :create, params
      end.to change(Sampling, :count).by(1)
    end

    it 'prevents mass assignment of a not-owned result_id' do
      other = create(:sound)
      params[:sampling].merge!(result_id: other.id)

      expect do
        post :create, params
      end.to_not change(Sampling, :count)

      expect(response.status).to be(403)
    end

    it 'redirects back' do
      post :create, params
      expect(response).to redirect_to(back)
    end
  end
end
