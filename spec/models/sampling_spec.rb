require 'spec_helper'

describe Sampling do
  describe 'validations' do
    it 'validates result and source are different' do
      sound = create(:sound)
      invalid = Sampling.new(source: sound, result: sound)
      expect(invalid).to_not be_valid
      expect(invalid.errors[:result].first).to match(/can't be the same/)
    end
  end
end
