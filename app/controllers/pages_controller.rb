class PagesController < ApplicationController

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to pages_path
    else
      render 'new'
    end
  end
  def destroy
    @page = Page.find(params[:id])
    @page.delete
    redirect_to pages_path
  end

  def show
  end
  private
  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:name, :title, :content)
  end
end