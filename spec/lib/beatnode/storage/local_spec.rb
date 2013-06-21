require 'spec_helper'

module Beatnode
  module Storage
    describe Local do
      let(:store_dir) { Rails.root.join('uploads', 'test') }
      let(:mp3_path)  { Rails.root.join('spec', 'fixtures', 'audio', 'test.mp3') }
      let(:mp3)       { File.new(mp3_path, 'rb') }

      subject { Local.new(store_dir) }

      describe '#store!' do
        let(:to_path) { store_dir.join('sound.mp3') }

        it 'saves a file to disk' do
          expect do
            subject.store!(mp3, 'sound.mp3')
          end.to change { File.exists?(to_path) }.from(false).to(true)
        end
      end

      describe '#fetch' do
        let(:from_path) { 'some/sound.mp3' }

        before { subject.store!(mp3, 'some/sound.mp3') }

        it 'fetches a file by relative path' do
          fetched = subject.fetch('some/sound.mp3')
          same    = FileUtils.identical?(fetched, mp3)

          expect(same).to be_true
        end
      end
    end
  end
end
