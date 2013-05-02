require 'spec_helper'

describe Auth do
  let(:sc_auth)  { Auth.new(Fixture(:soundcloud_auth)) }
  let(:dev_auth) { Auth.new(Fixture(:developer_auth)) }

  it 'delegates to the proper subclass' do
    expect(sc_auth).to  be_a(Auth::Soundcloud)
    expect(dev_auth).to be_a(Auth::Developer)
  end

  it 'returns the provider' do
    expect(sc_auth.provider).to  eq('soundcloud')
    expect(dev_auth.provider).to eq('developer')
  end

  it 'returns the provider_id' do
    expect(sc_auth.provider_id).to  eq('1226843')
    expect(dev_auth.provider_id).to eq('alex@test.com')
  end

  it 'returns the username' do
    expect(sc_auth.username).to  eq('Ricky Rice')
    expect(dev_auth.username).to eq('alex')
  end
end
