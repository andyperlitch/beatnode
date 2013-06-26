require 'spec_helper'

module Beatnode
  module Storage
    describe Local do
      let(:store_dir) { Rails.root.join('uploads', 'test') }
      let(:path)      { 'ab/cdef' }
      let(:dest)      { store_dir.join(path) }

      let(:mp3) do
        mp3_path = Rails.root.join('spec', 'fixtures', 'audio', 'test.mp3')
        File.new(mp3_path, 'rb')
      end

      subject { Local.new(store_dir) }

      before do
        subject.stub(:file_to_path).and_return(path)
      end

      describe '#store!' do
        it 'saves the file to disk' do
          expect do
            subject.store!(mp3)
          end.to change { File.exists?(dest) }.from(false).to(true)
        end

        it 'returns the relative path to the stored file' do
          expect(subject.store!(mp3)).to eq(path)
        end
      end

      describe '#fetch' do
        before { subject.store!(mp3) }

        it 'fetches a file by relative path' do
          fetched = subject.fetch(path)
          expect(FileUtils.identical?(fetched, mp3)).to be_true
        end
      end
    end
  end
end
