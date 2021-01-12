require 'contentful_client'

module Clients
  class ContentfulClient < SimpleDelegator
    include Singleton

    TEST_ENV_CONFIG = { access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
                        space: ENV['CONTENTFUL_SPACE_ID'] }.freeze
    DEV_ENV_CONFIG = { access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
                       space: ENV['CONTENTFUL_SPACE_ID'],
                       dynamic_entries: :auto,
                       logger: Rails.logger, raise_errors: true }.freeze

    def initialize
      client
      super(@client)
    end

    private

      def client
        @client ||= if Rails.env.test?
                      Contentful::Client.new(TEST_ENV_CONFIG)
                    else
                      Contentful::Client.new(DEV_ENV_CONFIG)
                    end
      end
  end
end
