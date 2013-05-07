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
    let(:auth_hash) do
      Fixture(:soundcloud_auth)
    end

    it 'creates a user' do
      expect do
        User.find_or_create_from_auth(auth_hash)
      end.to change(User, :count).by(1)
    end

    it 'sets the correct attributes' do
      user = User.find_or_create_from_auth(auth_hash)
      expect(user.username).to    eq(auth_hash['info']['nickname'])
      expect(user.provider_id).to eq(auth_hash['uid'])
    end

    it 'finds an existing user' do
      user = User.find_or_create_from_auth(auth_hash)

      expect(User.find_or_create_from_auth(auth_hash)).to eq(user)
    end
  end

  it 'has uploaded nodes' do
    node = create(:node, uploader: subject)
    expect(subject.uploaded_nodes).to include(node)
  end

  describe 'collaboration' do
    it 'creates followers' do
      follower = create(:user)
      collab   = create(:collaboration, source: follower, subject: subject)

      expect(subject.followers).to include(follower)
    end

    it 'creates followings' do
      followed = create(:user)
      collab   = create(:collaboration, source: subject, subject: followed)

      expect(subject.following).to include(followed)
    end
  end
end
