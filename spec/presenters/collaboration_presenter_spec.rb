require 'spec_helper'

describe CollaborationPresenter do
  let(:collaboration) { create(:collaboration) }

  subject { CollaborationPresenter.new(collaboration) }

  describe '#json' do
    it 'includes collaboration attributes' do
      expect(subject.json[:subject_id]).to be(collaboration.subject_id)
    end
  end
end
