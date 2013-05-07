require 'spec_helper'

describe Auth do
  subject { Auth.from_hash(Fixture(:soundcloud_auth)) }

  it 'delegates to the proper subclass' do
    expect(subject).to be_a(Auth::Soundcloud)
  end

  it 'returns the provider_name' do
    expect(subject.provider_name).to eq('soundcloud')
  end

  it 'returns the provider_id' do
    expect(subject.provider_id).to be(1226843)
  end

  it 'returns the username' do
    expect(subject.username).to eq('Ricky Rice')
  end
end
