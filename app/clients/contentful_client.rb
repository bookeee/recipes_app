require 'contentful_client'

class ContentfulClient < SimpleDelegator
  include Singleton

  def initialize
    client = set_client
    super(client)
  end

  private

    def set_client
      Contentful::Client.new(
        access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
        space: ENV['CONTENTFUL_SPACE_ID'],
        dynamic_entries: :auto,
        raise_errors: true
      )
    end
end
