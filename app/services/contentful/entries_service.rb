module Services
  module Contentful
    class EntriesService < Services::Contentful::Base
      CONTENT_TYPE = 'recipe'.freeze

      def call
        client.entries(content_type: 111)
      rescue ::Contentful::Error => e
        msg = "Error from Services::Contentful::EntriesService - #{e.message}"
        Rails.logger.debug(msg)
        false
      end
    end
  end
end
