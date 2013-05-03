require 'spec_helper'

describe NodesController, :signed_in do
  describe '#new' do
    it 'is successful' do
      get :new
      expect(response).to be_success
    end

    it 'assigns a new node belonging to the viewer' do
      get :new
      expect(assigns[:node].uploader).to eq(viewer)
    end
  end
end
