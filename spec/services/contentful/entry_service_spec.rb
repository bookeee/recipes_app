# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'EntriesService' do
  let(:id) { '1111111111111111' }
  let(:entry_service) { Services::Contentful::EntryService.new(id) }

  describe '#initialize' do
    it 'sets id' do
      expect(entry_service.instance_variable_get(:@id)).to eq(id)
    end
  end

  describe '#call' do
    let(:client) { Clients::ContentfulClient.instance }

    it 'makes request to contentful service' do
      allow(entry_service).to receive(:client).and_return(client)
      allow(client).to receive(:entry)

      entry_service.call
      expect(client).to have_received(:entry).with(id)
    end
  end
end
