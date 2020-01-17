class Api::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render 'index.json.jb'
  end

  def create
    @recipe = Recipe.new(
                          title: params[:title], 
                          chef: params[:chef],
                          ingredients: params[:ingredients],
                          directions: params[:directions],
                          prep_time: params[:prep_time]
                          )
    @recipe.save
    render 'show.json.jb' #It would be pointless to create a viewer for a post action. So instead you render a viewer that displays individual id's
  end

  def show
    @recipe = Recipe.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.title = params[:title] || @recipe.title
    @recipe.chef = params[:chef] || @recipe.chef
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.image_url = params[:image_url] || @recipe.image_url
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time

    @recipe.save
    render 'show.json.jb'
  end

end
