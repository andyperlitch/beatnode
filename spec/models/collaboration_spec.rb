require 'spec_helper'

describe Collaboration do
  describe 'validations' do
    it 'validates subject and source are different' do
      user = create(:user)
      invalid = Collaboration.new(source: user, subject: user)
      expect(invalid).to_not be_valid
      expect(invalid.errors[:subject].first).to match(/can't be the same/)
    end
  end
end
