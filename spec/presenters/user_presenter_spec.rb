require 'spec_helper'

describe UserPresenter do
  let(:user) { create(:user) }

  subject { UserPresenter.new(user) }

  describe '#json' do
    it 'includes user attributes' do
      expect(subject.json[:username]).to eq(user.username)
    end

    it 'includes uploaded sounds' do
      upload = create(:upload, user: user)
      expect(subject.json[:uploaded_sounds]).to eq([upload.sound_id])
    end

    it 'includes crated sounds' do
      sound = create(:sound)
      user.crate.add(sound)
      expect(subject.json[:crated_sounds]).to eq([sound.id])
    end
  end
end
