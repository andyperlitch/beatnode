shared_context 'with a signed in user', :signed_in => true do
  let(:viewer) { create(:user) }

  before do
    sign_in!(viewer)
  end
end
