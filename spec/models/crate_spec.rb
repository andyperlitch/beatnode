require 'spec_helper'

describe Crate do
  let(:user)    { create(:user) }
  let(:crating) { create(:crating, owner: user) }

  subject { Crate.new(user) }

  it 'implements Enumerable' do
    node = crating.node

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
      node = create(:node)
      expect(subject).to_not include(node)
    end

    it 'returns true' do
      crating
      expect(subject).to include(crating.node)
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
    let(:node) { create(:node) }

    it 'adds nodes' do
      subject.add(node)
      expect(subject).to include(node)
    end
  end
end
