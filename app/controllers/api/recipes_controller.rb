class Api::RecipesController < Api::BaseController
  # jitera-anchor-dont-touch: before_action_filter
  before_action :doorkeeper_authorize!, only: %w[index show update destroy]
  before_action :current_user_authenticate, only: %w[index show update destroy]

  # jitera-anchor-dont-touch: actions
  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @error_message = true unless @recipe&.destroy
  end

  def update
    @recipe = Recipe.find(params[:id])

    @error_object = @recipe.errors.messages unless @recipe.update(recipe_params)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @error_message = true if @recipe.blank?
  end

  def create
    @recipe = Recipe.new(recipe_params)

    @error_object = @recipe.errors.messages unless @recipe.save
  end

  def index
    @recipes = recipe_query_service.call(params)

    render json: @recipes, each_serializer: RecipeSerializer
  end

  private

  def recipe_query_service
    @recipe_query_service ||= ::Queries::Recipe.new(::Recipe.includes(:ingredients))
  end

  def recipe_params
    params.require(:recipe).permit(:title, :descriptions, :time, :difficulty, :category_id, :user_id)
  end
end
