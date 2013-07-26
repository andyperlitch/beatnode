require 'spec_helper'

describe SoundPresenter do
  let(:sound) { create(:sound) }

  subject { SoundPresenter.new(sound) }

  describe '#json' do
    it 'includes sound attributes' do
      expect(subject.json[:title]).to eq(sound.title)
    end

    it 'includes the uploader id' do
      upload = create(:upload, sound: sound)
      expect(subject.json[:uploader]).to be(upload.user_id)
    end
  end
end
