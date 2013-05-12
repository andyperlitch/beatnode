require 'spec_helper'

describe Crating do
  let(:user) { create(:user) }
  let(:sound) { create(:sound) }

  describe '.create_between' do
    it 'creates a crating' do
      crating = Crating.create_between(user, sound)

      expect(crating.owner).to be(user)
      expect(crating.sound).to  be(sound)
    end
  end

  describe 'validations' do
    it 'prevents duplicates' do
      crating = create(:crating)

      expect do
        Crating.create(:crating, owner: crating.owner,
                                 sound:  crating.sound)
      end.to raise_error
    end
  end
end
