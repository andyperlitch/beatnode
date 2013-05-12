require 'spec_helper'

describe Sound do
  subject { create(:sound, title: 'A sound') }

  it 'has an uploader' do
    expect(subject.uploader).to be_a(User)
  end

  it 'has a title' do
    expect(subject.title).to eq('A sound')
  end

  it 'has sources' do
    source   = create(:sound, title: 'Source')
    sampling = create(:sampling, source: source, result: subject)

    expect(subject.sources).to include(source)
  end

  it 'has usages' do
    usage    = create(:sound, title: 'Usage')
    sampling = create(:sampling, source: subject, result: usage)

    expect(subject.usages).to include(usage)
  end
end
