require 'spec_helper'

describe Crating do
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
