shared_context 'with a signed in user', signed_in: true do
  include_context 'requesting json'

  let(:viewer) { create(:user) }
  let(:back)   { root_path }

  before do
    request.env['HTTP_REFERER'] = back
    sign_in!(viewer)
  end
end
