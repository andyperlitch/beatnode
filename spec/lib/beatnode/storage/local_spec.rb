require 'spec_helper'

module Beatnode
  module Storage
    describe Local do
      let(:public_dir) { Rails.root.join('public') }
      let(:store_dir)  { 'uploads/test' }
      let(:mp3)        { generate(:mp3) }
      let(:sha1)       { 'abcdef' }
      let(:path)       { 'ab/cdef' }
      let(:dest)       { public_dir.join(store_dir, path) }

      subject { Local.new(public_dir, store_dir) }

      before { subject.stub(:file_to_sha1).and_return(sha1) }
      after  { subject.clear! }

      describe '#store!' do
        it 'saves the file to disk' do
          expect do
            subject.store!(mp3)
          end.to change { File.exists?(dest) }.from(false).to(true)
        end

        it 'returns the sha1 used to calculate the path' do
          expect(subject.store!(mp3)).to eq(sha1)
        end
      end

      describe '#fetch' do
        before { subject.store!(mp3) }

        it 'fetches a file by sha1' do
          fetched = subject.fetch(sha1)
          expect(FileUtils.identical?(fetched, mp3)).to be_true
        end
      end
    end
  end
end
