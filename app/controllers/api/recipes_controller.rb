class Api::RecipesController < ApplicationController

  def index
    search_term = params[:search]
    @recipes = Recipe.all

    if search_term
      @recipes = @recipes.where("chef iLIKE ? OR directions iLIKE ? OR title iLIKE ?", "%#{ search_term }%", "%#{ search_term }%", "%#{ search_term }%")
    end

    @recipes = @recipes.order(id: :asc)

    render 'index.json.jb'
  end

  def create
    @recipe = Recipe.new(
                          title: params[:title], 
                          user_id: 1, #current_user.id,
                          ingredients: params[:ingredients],
                          directions: params[:directions],
                          prep_time: params[:prep_time],
                          image_url: params[:image_url]
                          )
    @recipe.save
    render 'index.json.jb' 
  end

  def show
      @recipe = Recipe.find(params[:id])
      render 'show.json.jb'
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.title = params[:title] || @recipe.title
    # @recipe.chef = params[:chef] || @recipe.chef
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.image_url = params[:image_url] || @recipe.image_url
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time

    @recipe.save
    render 'show.json.jb'
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    render json: {message: "Recipe successfully destroyed from database"}
  end

end
