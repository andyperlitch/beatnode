require 'fileutils'

module Beatnode
  module Storage
    class Local < Struct.new(:store_dir)
      def store!(file, to_path)
        prepare_dir!(to_path)
        file.rewind

        File.open(full_path(to_path), 'wb') do |f|
          f.write(file.read)
        end

        true
      end

      def fetch(path)
        File.new(full_path(path), 'rb')
      end

      private

      def prepare_dir!(to_path)
        full = full_path(to_path)
        FileUtils.mkdir_p(File.dirname(full))
      end

      def full_path(path)
        File.join(store_dir, path)
      end
    end
  end
end
