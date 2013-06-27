require 'digest'

module Beatnode
  class UnknownStrategy < ArgumentError; end

  module Storage
    class << self
      attr_reader :strategy

      delegate :store!, :fetch, to: :strategy

      def use(strategy, options={})
        case strategy.to_sym
        when :local
          store_dir = options.fetch(:store_dir)
          @strategy = Local.new(store_dir)
        else
          raise UnknownStrategy, strategy.inspect
        end
      end

      def file_to_path(file)
        sha1_to_path(file_to_sha1(file))
      end

      def sha1_to_path(sha1)
        sha1.dup.insert(2, '/')
      end

      def file_to_sha1(file)
        Digest::SHA1.file(file).hexdigest
      end
    end

    class Strategy
      def store!(_)
        raise 'Implement #store! in subclass'
      end

      def fetch(_)
        raise 'Implement #fetch in subclass'
      end

      protected

      def file_to_path(file)
        Storage.file_to_path(file)
      end

      def sha1_to_path(sha1)
        Storage.sha1_to_path(sha1)
      end

      def file_to_sha1(file)
        Storage.file_to_sha1(file)
      end
    end
  end
end

Dir[File.dirname(__FILE__) + '/storage/*.rb'].each &method(:require)
