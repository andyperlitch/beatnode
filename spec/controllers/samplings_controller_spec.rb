require 'spec_helper'

describe SamplingsController, :signed_in do
  let(:source) { create(:node) }
  let(:result) { create(:node) }

  describe '#create' do
    let(:params) do
      {sampling: {source_id: source.id, result_id: result.id}}
    end

    let(:back) { root_path }

    before do
      request.env['HTTP_REFERER'] = back
    end

    it 'creates a sampling' do
      expect do
        post :create, params
      end.to change(Sampling, :count).by(1)
    end

    it 'redirects back' do
      post :create, params
      expect(response).to redirect_to(back)
    end
  end
end
