require 'spec_helper'

describe Sound do
  subject { create(:sound, title: 'A sound') }

  it 'has an uploader' do
    expect(subject.uploader).to be_a(User)
  end

  it 'has a title' do
    expect(subject.title).to eq('A sound')
  end
end
