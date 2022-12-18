class Api::IngredientsController < Api::BaseController
  # jitera-anchor-dont-touch: before_action_filter

  # jitera-anchor-dont-touch: actions
  def destroy
    @ingredient = Ingredient.find_by(id: params[:id])

    @error_message = true unless @ingredient&.destroy
  end

  def update
    @ingredient = Ingredient.find_by(id: params[:id])

    @error_object = @ingredient.errors.messages unless @ingredient&.update(ingredient_params)
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
    @error_message = true if @ingredient.blank?
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    @error_object = @ingredient.errors.messages unless @ingredient.save
  end

  def index
    @ingredients = Ingredient.all
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:recipe_id, :unit, :amount)
  end
end
