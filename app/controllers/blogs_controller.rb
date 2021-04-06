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
  end

  def create
    blog = Blog.new(blog_params)
    blog.save
    redirect_to blog_path(blog.id)
  end



  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end
end
