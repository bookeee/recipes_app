# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  before do
    stub_client
  end

  describe 'GET #index' do
    context 'when recipes are found' do
      before do
        stub_request(
          :get,
          %r{(https://cdn\.contentful\.com/spaces/)([^\s]+)
             (environments/master/entries\?content_type=recipe)}x
        ).to_return(
          status: 200,
          body: json_data(filename: 'payloads/recipes').to_json
        )
        get :index
      end

      it 'assigns @recipes' do
        expected_result = 4
        expect(assigns(:recipes).count).to eq(expected_result)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'when recipes are not found' do
      before do
        stub_request(
          :get,
          %r{(https://cdn\.contentful\.com/spaces/)([^\s]+)
             (environments/master/entries\?content_type=recipe)}x
        ).to_return(
          status: 200,
          body: json_data(filename: 'payloads/recipes_not_found').to_json
        )
        get :index
      end

      it 'sets zero @recipes' do
        expected_result = 0
        expect(assigns(:recipes).count).to eq(expected_result)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET #show' do
    context 'when recipe is found' do
      before do
        recipe_id = '4dT8tcb6ukGSIg2YyuGEOm'
        stub_request(
          :get,
          %r{(https://cdn\.contentful\.com/spaces/)([^\s]+)
             (environments/master/entries\?sys\.id=#{recipe_id})}x
        ).to_return(
          status: 200,
          body: json_data(filename: 'payloads/recipe').to_json
        )

        get :show, params: { id: recipe_id }
      end

      it 'assigns @recipe' do
        expected_result = '4dT8tcb6ukGSIg2YyuGEOm'
        expect(assigns(:recipe).id).to eq(expected_result)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end
    end

    context 'when recipe is not found' do
      before do
        recipe_id = '11111111111111111111111111'
        stub_request(
          :get,
          %r{(https://cdn\.contentful\.com/spaces/)([^\s]+)
             (environments/master/entries\?sys\.id=#{recipe_id})}x
        ).to_return(
          status: 200,
          body: json_data(filename: 'payloads/recipe_not_found').to_json
        )

        get :show, params: { id: recipe_id }
      end

      it 'sets @recipe to nil' do
        expected_result = nil
        expect(assigns(:recipe).object).to eq(expected_result)
      end

      it 'renders the 404 template' do
        path = '/public/404.html'
        expect(response).to render_template(file: "#{Rails.root}#{path}")
      end
    end
  end
end
