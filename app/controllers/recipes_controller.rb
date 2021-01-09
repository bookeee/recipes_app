class RecipesController < ApplicationController
  def index
    @recipes = decorated_recipes
  end

  def show
    @recipe = decorated_recipe
    return not_found if @recipe.object.nil?
  end

  private

    def decorated_recipes
      RecipeDecorator.decorate_collection(recipes)
    end

    def decorated_recipe
      RecipeDecorator.decorate(recipe)
    end

    def recipes
      Services::Contentful::EntriesService.new.call
    end

    def recipe
      Services::Contentful::EntryService.new(params[:id]).call
    end

    def not_found
      render file: Rails.root.join('public/404'), status: :not_found,
             layout: false
    end
end
