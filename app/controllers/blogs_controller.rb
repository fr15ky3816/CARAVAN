class BlogsController < ApplicationController

  def index
    @blog = Blog.all
  end

  def show
    @blog = Blog.find_by(id: params[:id])

  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find_by(id: params[:id])

  end

  def create
    blog = Blog.new(blog_params)
    blog.save
    redirect_to blogs_path
  end

  def update
    blog = Blog.find_by(id: params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  def destroy
    blog = Blog.find_by(id: params[:id])
    blog.destroy
    redirect_to blogs_path
  end



  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end
end
