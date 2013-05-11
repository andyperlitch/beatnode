require 'spec_helper'

describe Crating do
  let(:user) { create(:user) }
  let(:node) { create(:node) }

  describe '.create_between' do
    it 'creates a crating' do
      crating = Crating.create_between(user, node)

      expect(crating.owner).to be(user)
      expect(crating.node).to  be(node)
    end
  end

  describe 'validations' do
    it 'prevents duplicates' do
      crating = create(:crating)

      expect do
        Crating.create(:crating, owner: crating.owner,
                                 node:  crating.node)
      end.to raise_error
    end
  end
end
