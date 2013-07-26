require 'spec_helper'

describe CratingPresenter do
  let(:crating) { create(:crating) }

  subject { CratingPresenter.new(crating) }

  describe '#json' do
    it 'includes crating attributes' do
      expect(subject.json[:owner_id]).to be(crating.owner_id)
    end
  end
end
