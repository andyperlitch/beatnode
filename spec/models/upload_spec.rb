require 'spec_helper'

describe Upload do
  subject { create(:upload) }

  it 'validates sha1' do
    subject.sha1 = ''
    expect(subject).not_to be_valid
    expect(subject.errors[:sha1]).to be_present
  end
end
