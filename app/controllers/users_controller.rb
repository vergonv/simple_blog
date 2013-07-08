class UsersController < ApplicationController
  layout "staff"
  def index
    list
    render 'list'
  end

  def list
    @users = User.all
  end

  def manage
    @users = User.all
    @user = User.new if  @user.nil?
     @user = User.find(params[:id])   if params[:id]
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to 'list', :notice => "Successfully created user."
    else
      render :action => 'manage'
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to 'list', :notice  => "Successfully updated user."
    else
      render :action => 'manage'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to 'manage', :notice => "Successfully destroyed user."
  end
end
