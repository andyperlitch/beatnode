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

  describe '#create' do
    let(:params) { {node: {title: 'A title'}} }

    it 'creates a node' do
      expect do
        post :create, params
      end.to change(Node, :count).by(1)
    end

    it 'sets attributes' do
      post :create, params
      expect(Node.last.title).to eq('A title')
    end

    it 'redirects to the home page' do
      post :create, params
      expect(response).to redirect_to(root_path)
    end

    it 're-renders the new action if there are errors' do
      post :create, {node: {title: ''}}
      assert_template :new
    end
  end

  describe '#show' do
    let(:node)      { create(:node) }
    let(:source)    { create(:node) }
    let!(:sampling) { create(:sampling, source: source, result: node) }

    it 'assigns @sources' do
      get :show, id: node.node_id
      expect(assigns[:sources]).to include(source)
    end
  end
end
