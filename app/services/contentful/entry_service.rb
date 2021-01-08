module Services
  module Contentful
    class EntryService < Services::Contentful::Base
      def initialize(id)
        super
        @id = id
      end

      def call
        client.entry(@id)
      end
    end
  end
end
