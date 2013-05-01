require 'spec_helper'

describe User do
  let(:uname)       { generate(:username) }
  let(:provider_id) { generate(:provider_id) }

  subject do
    create(:user, :username => uname, :provider_id => provider_id)
  end

  describe '.find_or_create_from_soundcloud_auth' do
    let(:auth_hash) do
      Fixture(:soundcloud_auth)
    end

    it 'creates a user' do
      expect do
        User.find_or_create_from_soundcloud_auth(auth_hash)
      end.to change(User, :count).by(1)
    end

    it 'sets the correct attributes' do
      user = User.find_or_create_from_soundcloud_auth(auth_hash)
      expect(user.username).to    eq(auth_hash['info']['nickname'])
      expect(user.provider_id).to be(auth_hash['uid'].to_i)
    end

    it 'finds an existing user' do
      user = User.find_or_create_from_soundcloud_auth(auth_hash)

      expect(User.find_or_create_from_soundcloud_auth(auth_hash)).to eq(user)
    end
  end

  it 'has a username' do
    expect(subject.username).to eq(uname)
  end

  it 'has a provider_id' do
    expect(subject.provider_id).to be(provider_id)
  end
end
