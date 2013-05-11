require 'spec_helper'

describe Node do
  subject { create(:node, title: 'A node') }

  it 'has an uploader' do
    expect(subject.uploader).to be_a(User)
  end

  it 'has a title' do
    expect(subject.title).to eq('A node')
  end

  it 'has sources' do
    source   = create(:node, title: 'Source')
    sampling = create(:sampling, source: source, result: subject)

    expect(subject.sources).to include(source)
  end

  it 'has usages' do
    usage    = create(:node, title: 'Usage')
    sampling = create(:sampling, source: subject, result: usage)

    expect(subject.usages).to include(usage)
  end
end
