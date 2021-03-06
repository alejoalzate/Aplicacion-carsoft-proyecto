class ResultsController < ApplicationController
  def index
  
    if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    
    @results = Result.page(params[:page]).per_page(params[:registro].to_i)
    respond_to do |format|
      format.html 
      format.json { render json: @results }
    end
  end

  def show
      @result = Result.find(params[:id])
  end

  def new
      @result = Result.new
  end

  def edit
     @result = Result.find(params[:id])
  end

  def create
      @result = Result.new(params[:result])
      render :action => :new unless @result.save
      
  end

  def update
      @result = Result.find(params[:id])
      render :action => :edit unless @result.update_attributes(params[:result])
  end

  def destroy
      @result = Result.find(params[:id])
      @result.destroy
     
  end  
end
