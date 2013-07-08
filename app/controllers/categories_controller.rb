class CategoriesController < ApplicationController

  layout "staff"

  def index
    @categories = Category.all
    @category=params[:id].blank? ?  Category.new : Category.find(params[:id])
   render :action => 'index'
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = 'Category was successfully created.'
      redirect_to :action => 'index'
    else
      render :action => 'index'
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = 'Category was successfully updated.'
      redirect_to :action => 'index'
    else
      render :action => 'index'
    end
  end

  def des
    @category=Category.find(params[:id])
     @category.destroy
    redirect_to :action => 'index'
  end
end
