require 'spec_helper'

describe PagesController, :signed_in do
  it 'redirects to the sign in page if no one is signed in' do
    sign_out!
    get :home
    response.should redirect_to(sign_in_path)
  end

  describe '#home' do
    it 'assigns @viewer_nodes' do
      node = create(:node, uploader: viewer)
      get :home
      expect(assigns[:uploaded_nodes]).to include(node)
    end
  end

  describe '#crate' do
    it 'assigns @crate' do
      node = create(:crating, owner: viewer).node
      get :crate
      expect(assigns[:crate]).to include(node)
    end
  end
end
