class Recipe
  attr_accessor :id, :description, :photo, :chef

  def fields
    { chef: 'chef_example_name' }
  end
end

FactoryBot.define do
  factory :recipe, class: 'Recipe' do
    id { '111111111122222' }
    description { 'Test description' }
    association :photo
    association :chef
  end

  after :build do |recipe|
    recipe.photo << create(:photo)
    recipe.chef << create(:chef)
  end
end
