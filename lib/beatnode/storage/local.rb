require 'fileutils'

module Beatnode
  module Storage
    class Local < Strategy
      attr_reader :public_dir, :store_dir

      def initialize(public_dir, store_dir)
        @public_dir = clean_dir(public_dir)
        @store_dir  = clean_dir(store_dir)
      end

      def store!(file)
        sha1     = file_to_sha1(file)
        rel_path = sha1_to_path(sha1)
        dest     = full_path(rel_path)

        unless File.exists?(dest)
          prepare_dir!(dest)
          file.rewind

          File.open(dest, 'wb') do |f|
            f.write(file.read)
          end
        end

        sha1
      end

      def fetch(sha1)
        from_path = sha1_to_path(sha1)
        File.new(full_path(from_path), 'rb')
      end

      def clear!
        FileUtils.rm_rf(base_path)
      end

      private

      def clean_dir(dir)
        dir.sub(/\/+$/, '')
      end

      def prepare_dir!(to_path)
        FileUtils.mkdir_p(File.dirname(to_path))
      end

      def full_path(rel_path)
        File.join(base_path, rel_path)
      end

      def base_path
        File.join(public_dir, store_dir)
      end
    end
  end
end
