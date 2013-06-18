require 'spec_helper'

describe SoundUploader do
  let(:path) { __FILE__ }
  let(:file) { File.open(path) }

  subject { SoundUploader.new }

  after { subject.remove! }

  it 'stores files' do
    subject.store!(file)
    expect(subject.filename).to eq(File.basename(path))
  end
end
