require 'spec_helper'

describe PagesController, :signed_in do
  it 'redirects to the sign in page if no one is signed in' do
    sign_out!
    get :home
    response.should redirect_to(sign_in_path)
  end

  describe '#home' do
  end

  describe '#crate' do
    it 'assigns @crate' do
      sound = create(:crating, owner: viewer).sound
      get :crate
      expect(assigns[:crate]).to include(sound)
    end
  end

  describe '#uploads' do
    it 'assigns @uploaded_sounds' do
      sound = create(:upload, user: viewer).sound
      get :uploads
      expect(assigns[:uploaded_sounds]).to include(sound)
    end
  end
end
