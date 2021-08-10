# frozen_string_literal: true

module Mixins
  module Interactor
    module ClassMethods
      def method_missing(m, *args, &block)
        service = new

        if service.respond_to?(m)
          service.public_send(m, *args, &block)
          service
        else
          raise NoMethodError, "Method `#{m}` doesn't exist."
        end
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

    def initialize
      @errors = []
    end

    def errors
      @errors
    end

    def add_error(error)
      @errors << error
    end

    def failed?
      @errors.any?
    end

    def success?
      @errors.empty?
    end
  end
end
