require 'spec_helper'

describe Upload do
  subject { create(:upload) }

  it 'validates location' do
    subject.location = ''
    expect(subject).not_to be_valid
    expect(subject.errors[:location]).to be_present
  end

  it 'validates associated sound' do
    subject.sound.title = ''
    expect(subject).not_to be_valid
    expect(subject.errors.on(:sound)).to include('title is not present')
  end

  describe '.create_for' do
    let(:user)        { create(:user) }
    let(:attrs)       { attributes_for(:upload) }
    let(:sound_attrs) { attributes_for(:sound) }

    it 'creates an Upload' do
      expect do
        Upload.create_for(user, attrs, sound_attrs)
      end.to change(Upload, :count).by(1)
    end

    it 'creates a sound' do
      expect do
        Upload.create_for(user, attrs, sound_attrs)
      end.to change(Sound, :count).by(1)
    end

    it 'creates an upload belonging to the user' do
      expect do
        Upload.create_for(user, attrs, sound_attrs)
      end.to change { user.uploads.count }.by(1)
    end
  end
end
