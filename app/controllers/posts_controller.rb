class PostsController < ApplicationController
  def new
    @school = School.find(params[:school_id])
    @event = Event.find(params[:event_id])
    @account = current_user.account
    @board = Board.find(params[:board_id])
    @post = Post.new
  end

  def create
    @account = current_user.account
    @board = Board.find(params[:board_id])
    Post.create!(board_id: @board.id, account_id: @account.id, post: params[:post][:post])
  end
end
