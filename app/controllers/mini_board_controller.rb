class MiniBoardController < ApplicationController
  before_action :authenticate_user!, except: [:landing]
  def landing
    if user_signed_in?
      redirect_to '/mini_board/index'
    end
  end
  
  def index
      @posts = Post.all
      @user = current_user.email
   end

  
  def create
    new_post = Post.new
    new_post.writer = current_user.email
    new_post.content = params[:content]
    new_post.user = current_user
    new_post.save
    redirect_to '/mini_board/index'
    
  end

  def update
  end

  def destroy
  end
  
  def comment_create
    new_comment = Comment.new
    new_comment.post_id = params[:post_id]
    new_comment.content = params[:content]
    new_comment.user = current_user
    new_comment.save
    redirect_to '/mini_board/index'
  end
  
  def comment_update
  end
  
  def comment_destroy
  end
  
end


