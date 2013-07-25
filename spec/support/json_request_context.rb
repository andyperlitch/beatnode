require 'oj'

shared_context 'requesting json', json: true do
  let(:json_response) { Oj.load(response.body) }

  before do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end
end
