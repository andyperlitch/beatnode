require 'spec_helper'

describe Node do
  subject { create(:node, title: 'A node') }

  it 'has an uploader' do
    expect(subject.uploader).to be_a(User)
  end

  it 'has a title' do
    expect(subject.title).to eq('A node')
  end

  it 'has parents' do
    parent     = create(:node, title: 'Parent')
    connection = create(:connection, parent: parent, child: subject)

    expect(subject.parents).to include(parent)
  end

  it 'has children' do
    child      = create(:node, title: 'Child')
    connection = create(:connection, parent: subject, child: child)

    expect(subject.children).to include(child)
  end
end
