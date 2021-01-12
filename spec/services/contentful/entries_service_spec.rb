# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'EntriesService' do
  let(:entries_service) { Services::Contentful::EntriesService.new }
  let(:client) { Clients::ContentfulClient.instance }

  describe '#call' do
    it 'makes request to contentful service' do
      allow(entries_service).to receive(:client).and_return(client)
      allow(client).to receive(:entries)

      entries_service.call
      expect(client).to have_received(:entries).with(content_type: 'recipe')
    end
  end
end
