Dir[File.dirname(__FILE__) + '/storage/*.rb'].each &method(:require)

module Beatnode
  class UnknownStrategy < ArgumentError; end

  module Storage
    class << self
      attr_reader :strategy

      def included(base)
        base.send(:include, StorageMethods)
      end

      def use(strategy, options={})
        case strategy.to_sym
        when :local
          store_dir = options.fetch(:store_dir)
          @strategy = Local.new(store_dir)
        else
          raise UnknownStrategy, strategy.inspect
        end
      end
    end

    module StorageMethods
      def store!(*args)
        Storage.strategy.store!(*args)
      end

      def fetch(*args)
        Storage.strategy.fetch(*args)
      end
    end
  end
end
