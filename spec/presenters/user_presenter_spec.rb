require 'spec_helper'

describe UserPresenter do
  let(:user) { create(:user) }

  subject { UserPresenter.new(user) }

  describe '#json' do
    it 'includes uploaded sounds' do
      upload = create(:upload, user: user)
      expect(subject.json[:uploaded_sounds]).to eq([upload.sound_id])
    end
  end
end
