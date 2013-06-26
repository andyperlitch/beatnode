require 'fileutils'

module Beatnode
  module Storage
    class Local < Strategy
      attr_reader :store_dir

      def initialize(store_dir)
        @store_dir = store_dir
      end

      def store!(file)
        rel_path = file_to_path(file)
        dest     = full_path(rel_path)

        unless File.exists?(dest)
          prepare_dir!(dest)
          file.rewind

          File.open(dest, 'wb') do |f|
            f.write(file.read)
          end
        end

        rel_path
      end

      def fetch(sha1)
        from_path = sha1_to_path(sha1)
        File.new(full_path(from_path), 'rb')
      end

      private

      def prepare_dir!(to_path)
        FileUtils.mkdir_p(File.dirname(to_path))
      end

      def full_path(rel_path)
        File.join(store_dir, rel_path)
      end
    end
  end
end
