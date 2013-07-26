require 'spec_helper'

describe User do
  let(:username)      { generate(:username) }
  let(:provider_id)   { generate(:provider_id) }
  let(:provider_name) { 'soundcloud' }

  subject do
    create(:user, username: username,
                  provider_id: provider_id,
                  provider_name: provider_name)
  end

  its(:username)      { should eq(username) }
  its(:provider_id)   { should eq(provider_id) }
  its(:provider_name) { should eq(provider_name) }

  describe '.find_or_create_from_auth' do
    let(:auth) do
      double(:auth, provider_name: 'soundcloud',
                    provider_id: 123,
                    username: 'username')
    end

    it 'creates a user' do
      expect {
        User.find_or_create_from_auth(auth)
      }.to change(User, :count).by(1)
    end

    it 'sets the correct attributes' do
      user = User.find_or_create_from_auth(auth)
      expect(user.username).to    eq('username')
      expect(user.provider_id).to eq(123)
    end

    it 'finds an existing user' do
      user = User.find_or_create_from_auth(auth)
      expect(User.find_or_create_from_auth(auth)).to eq(user)
    end
  end

  describe '#crate' do
    it 'returns a Crate object' do
      expect(subject.crate).to be_a(Crate)
    end

    it 'belongs to the user' do
      expect(subject.crate.user).to be(subject)
    end
  end
end
