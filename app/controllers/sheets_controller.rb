class SheetsController < ApplicationController
  def index
     if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    @sheets = Sheet.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html
      format.json { render json: @sheets }
    end
  end
  def show
      @sheet = Sheet.find(params[:id])
  end

  def new
      @sheet = Sheet.new
  end

  def edit
     @sheet = Sheet.find(params[:id])
  end

  def create
      @sheet = Sheet.new(params[:sheet])
      render :action => :new unless @sheet.save
      
  end

  def update
      @sheet = Sheet.find(params[:id])
      render :action => :edit unless @sheet.update_attributes(params[:sheet])
  end

  def destroy
      @sheet = Sheet.find(params[:id])
      @sheet.destroy
     
  end  
end
