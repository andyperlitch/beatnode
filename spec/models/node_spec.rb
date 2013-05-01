require 'spec_helper'

describe Node do
  subject { create(:node, name: 'A node') }

  it 'has a name' do
    expect(subject.name).to eq('A node')
  end

  it 'has parents' do
    parent     = create(:node, name: 'Parent')
    connection = create(:connection, parent: parent, child: subject)

    expect(subject.parents).to include(parent)
  end
end
