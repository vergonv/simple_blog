class PostsController < ApplicationController
  layout "staff"
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @user_list = get_user_list
  end

   def create
    post_params = params[:post]
    author_id = post_params.delete(:author_id)
    @post = Post.new(post_params)
    @post.author = User.find(author_id)
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to :action => 'index'
    else
      @user_list = get_user_list
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user_list = get_user_list
  end

  def update
    post_params = params[:post]
    author_id = post_params.delete(:author_id)
    @post = Post.find(params[:id])
    @post.author = User.find(author_id) if @post.author_id != author_id
    if @post.update_attributes(post_params)
      flash[:notice] = 'Post was successfully updated.'
      redirect_to :action => 'index'
    else
      @user_list = get_user_list
      render :action => 'edit'
    end
  end

  def destro
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  private #----------

  def get_user_list
    return User.find(:all, :order => 'last_name ASC').collect {|user| [user.full_name, user.id]}
  end



end
