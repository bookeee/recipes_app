class Chef
  attr_accessor :id, :name
end

FactoryBot.define do
  factory :chef, class: 'Chef' do
    name { 'chef_example_name' }
  end
end
