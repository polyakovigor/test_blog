class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @posts = @category.posts
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = 'Category was successfully created.'
      redirect_to @category
    else
      flash[:error] = @category.errors.full_messages
      render :new
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category was successfully updated.'
      redirect_to @category
    else
      flash[:error] = @category.errors.full_messages
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = 'Category was successfully destroyed.'
    redirect_to categories_url
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end


    def category_params
      params.require(:category).permit(:name, :description)
    end
end
