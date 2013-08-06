require 'spec_helper'

describe Upload do
  subject { create(:upload) }

  it 'validates sha1 presence' do
    subject.sha1 = ''
    expect(subject).to_not be_valid
    expect(subject.errors[:sha1]).to be_present
  end

  it 'validates content_type presence' do
    subject.content_type = ''
    expect(subject).to_not be_valid
    expect(subject.errors[:content_type]).to be_present
  end
end
