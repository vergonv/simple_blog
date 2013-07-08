class CommentsController < ApplicationController
def index
	list
	render 'list'
end
  def list
  	 @comments=Comment.all
  end

  def show
  end
end
