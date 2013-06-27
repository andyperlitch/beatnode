require 'spec_helper'

describe Sound do
  subject { create(:sound, title: 'A sound') }

  describe '#uploader' do
    it 'is nil' do
      expect(subject.uploader).to be_nil
    end

    it 'pulls from uploads join table' do
      upload = create(:upload, :sound => subject)
      expect(subject.uploader).to eq(upload.user)
    end
  end

  describe '#upload' do
    it 'is nil' do
      expect(subject.upload).to be_nil
    end

    it 'returns an upload' do
      upload = create(:upload, sound: subject)
      expect(subject.upload).to eq(upload)
    end
  end
end
