require 'spec_helper'

describe PagesController do
  it 'redirects to the sign in page if no one is signed in' do
    get :home
    response.should redirect_to(sign_in_path)
  end

  describe '#home' do
  end
end
