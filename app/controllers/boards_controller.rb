class BoardsController < ApplicationController
  before_action :authenticate_user!
  def show
    @board = Board.find(params[:id])
  end
end
