class AnswersController < ApplicationController
  def index

    if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    @answers = Answer.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answers }
    end
  end

  def show
      @answer = Answer.find(params[:id])
  end

  def new
      @answer = Answer.new
  end

  def edit
      @answer = Answer.find(params[:id])
  end

  def create
      @answer = Answer.new(params[:answer])
      render :action => :new unless @answer.save
      
  end

  def update
      @answer = Answer.find(params[:id])
      render :action => :edit unless @answer.update_attributes(params[:answer])
  end

  def destroy
      @answer = Answer.find(params[:id])
      @answer.destroy
     
  end  
end