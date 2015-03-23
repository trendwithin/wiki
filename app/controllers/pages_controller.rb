class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = current_user.pages.new(page_params)
    if @page.save
      @page.users << current_user
      redirect_to @page, notice: 'Page was successfully created'
    else
      render :new
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    @page.users |= [current_user]
    if @page.update(page_params)
      redirect_to @page, notice: 'Page was successfully updated'
    else
      render :edie
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    redirect_to pages_url, notice: 'Page was successfully deleted'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :body)
    end
end
