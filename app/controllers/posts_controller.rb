class PostsController < ApplicationController

  def new
    if @current_user
      @post = Post.new
      @post.place_id = params["place_id"]
      @post.user_id = @current_user["id"]
    else
      flash["notice"] = "Login first."
    end
  end

  def create
    if @current_user
      @post = Post.new
      @post["title"] = params["post"]["title"]
      @post["description"] = params["post"]["description"]
      @post["posted_on"] = params["post"]["posted_on"]
      @post["place_id"] = params["post"]["place_id"]
      @post.uploaded_image.attach(params["post"]["uploaded_image"])
      @post["user_id"] = @current_user["id"]
      @post.save
      redirect_to "/places/#{@post["place_id"]}"
    else
      flash["notice"] = "Login first."
    end
  end

end
