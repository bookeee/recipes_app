class Photo
  attr_accessor :id, :url
end

FactoryBot.define do
  factory :photo, class: 'Photo' do
    url { 'www.url-example.example' }
  end
end
