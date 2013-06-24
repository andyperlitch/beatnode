require 'spec_helper'

describe SoundUploader do
  let(:user)         { create(:user) }
  let(:upload_attrs) { attributes_for(:upload).except(:location) }
  let(:sound_attrs)  { attributes_for(:sound) }

  subject { SoundUploader.new(user, upload_attrs, sound_attrs) }

  describe '#upload!' do
    let(:result) do
      subject.upload!
      Upload.last
    end

    it 'creates an Upload' do
      expect do
        subject.upload!
      end.to change(Upload, :count).by(1)
    end

    it 'sets upload attributes' do
      expect(result.user).to eq(user)
    end

    it 'creates a sound' do
      expect do
        subject.upload!
      end.to change(Sound, :count).by(1)
    end

    it 'sets sound attributes' do
      sound_attrs.each do |attr, value|
        expect(result.sound.send(attr)).to eq(value)
      end
    end

    it 'adds the sound to the users crate' do
      expect do
        subject.upload!
      end.to change { user.crate.count }.by(1)
    end
  end

  describe 'valdation' do
    it 'passes' do
      expect(subject).to be_valid
    end

    it 'fails with an invalid sound' do
      sound_attrs.delete(:title)
      expect(subject).not_to be_valid
      expect(subject.errors[:sound]).to include('title is not present')
    end
  end
end
