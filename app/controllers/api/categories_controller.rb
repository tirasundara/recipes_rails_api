class Api::CategoriesController < Api::BaseController
  # jitera-anchor-dont-touch: before_action_filter

  # jitera-anchor-dont-touch: actions
  def destroy
    @category = Category.find_by(id: params[:id])

    @error_message = true unless @category&.destroy
  end

  def update
    @category = Category.find_by(id: params[:id])

    @error_object = @category.errors.messages unless @category&.update(category_params)
  end

  def show
    @category = Category.find_by(id: params[:id])
    @error_message = true if @category.blank?
  end

  def create
    @category = Category.new(category_params)

    @error_object = @category.errors.messages unless @category.save
  end

  def index
    @categories = Category.all
  end

  private

  def category_params
    params.require(:category).permit(:description)
  end
end
