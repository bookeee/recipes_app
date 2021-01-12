require 'rails_helper'

describe RecipeDecorator do
  let(:recipe) { described_class.decorate(FactoryBot.build_stubbed(:recipe)) }

  it 'returns image_url' do
    expected_result = 'www.url-example.example'
    expect(recipe.image_url).to eq(expected_result)
  end

  it 'returns chef name' do
    expected_result = 'chef_example_name'
    expect(recipe.chef_name).to eq(expected_result)
  end

  it 'returns decription' do
    expected_result = "<p>Test description</p>\n"
    expect(recipe.decription_html).to eq(expected_result)
  end
end
