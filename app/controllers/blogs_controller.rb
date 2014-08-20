class BlogsController < ApplicationController
  def index
    @blog = Blog.all
  end    
end
