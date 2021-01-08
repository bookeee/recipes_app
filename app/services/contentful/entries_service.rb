module Services
  module Contentful
    class EntriesService < Services::Contentful::Base
      CONTENT_TYPE = 'recipe'.freeze

      def call
        client.entries(content_type: CONTENT_TYPE)
      end
    end
  end
end
