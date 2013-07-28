require 'spec_helper'

module Beatnode
  describe Storage do
    let(:file) { generate(:mp3) }
    let(:conn) { generate(:aws) }

    subject { Storage.new(conn) }

    it 'stores and fetches unique files' do
      sha1 = subject.store!(file)
      expect(subject.fetch(sha1).content_length).to eq(file.size)
    end
  end
end
