require 'spec_helper'

describe Upload do
  subject { create(:upload) }

  it 'validates location' do
    subject.location = ''
    expect(subject).not_to be_valid
    expect(subject.errors[:location]).to be_present
  end
end
