require 'spec_helper'

describe Crate do
  let(:user)    { create(:user) }
  let(:crating) { create(:crating, owner: user) }

  subject { Crate.new(user) }

  it 'implements Enumerable' do
    sound = crating.sound

    subject.each do |n|
      expect(subject).to include(n)
    end
  end

  describe '#empty?' do
    it 'returns true' do
      expect(subject).to be_empty
    end

    it 'returns false' do
      crating
      expect(subject).to_not be_empty
    end
  end

  describe '#include?' do
    it 'returns false' do
      sound = create(:sound)
      expect(subject).to_not include(sound)
    end

    it 'returns true' do
      crating
      expect(subject).to include(crating.sound)
    end
  end

  describe '#count' do
    it 'returns 0' do
      expect(subject.count).to be(0)
    end

    it 'returns 1' do
      crating
      expect(subject.count).to be(1)
    end
  end

  describe '#add' do
    let(:sound) { create(:sound) }

    it 'adds sounds' do
      subject.add(sound)
      expect(subject).to include(sound)
    end
  end

  describe '#without' do
    let(:sound) { create(:sound) }

    before { subject.add(sound) }

    it 'discludes the sound from the crate' do
      expect(subject.without(sound)).to_not include(sound)
    end

    it 'discludes several sounds' do
      other_sound = create(:sound)
      subject.add(other_sound)
      expect(subject.without(sound, other_sound)).to be_empty
    end

    it 'is non-destructive' do
      subject.without(sound)
      expect(subject).to include(sound)
    end
  end
end
