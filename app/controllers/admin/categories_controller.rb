class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with :name => MY_USER, :password => MY_PASS
  def index
    @categorieslist = Category.all
  end

  def new
    @categoriescreate = Category.new
  end

  def create
    @categoriescreate = Category.new(category_params)

    if @categoriescreate.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
