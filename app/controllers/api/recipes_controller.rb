class Api::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render 'index.json.jb'
  end

  def show
    @recipe = Recipe.find(params[:id])
    render 'show.json.jb'
  end


end
