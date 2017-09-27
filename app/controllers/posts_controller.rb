class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:new, :create, :destroy]

  def show
  end

  def new
    @post = @category.posts.new
  end

  def edit
  end

  def create
    @post = @category.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to category_path(@category)
    else
      flash[:error] = @post.errors.full_messages
      render :new
    end
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = 'Post was successfully updated.'
      redirect_to @post
    else
      flash[:error] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post was successfully destroyed.'
    redirect_to category_path(@category)
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

    def post_params
      params.require(:post).permit(:name, :content, :file)
    end
end
