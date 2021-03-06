class RolsController < ApplicationController

  def index
    if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    @rols = Rol.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html 
      format.json { render json: @rols }
    end
  end
  def show
      @rol = Rol.find(params[:id])
  end

  def new
      @rol = Rol.new
  end

  def edit
     @rol = Rol.find(params[:id])
  end

  def create
      @rol = Rol.new(params[:rol])
      render :action => :new unless @rol.save
      
  end

  def update
      @rol = Rol.find(params[:id])
      render :action => :edit unless @rol.update_attributes(params[:rol])
  end

  def destroy
      @rol = Rol.find(params[:id])
      @rol.destroy
     
  end  
end
