module Services
  module Contentful
    class Base
      private

        def client
          @client ||= Clients::ContentfulClient.instance
        end
    end
  end
end
