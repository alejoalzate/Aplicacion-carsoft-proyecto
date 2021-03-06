class QuestionsController < ApplicationController
  def index
     if params[:registro] == nil or params[:registro] <= '0' then 
        params[:registro] = 2 
    end
    @questions = Question.search(params[:buscar]).page(params[:page]).per_page(params[:registro].to_i)

    respond_to do |format|
      format.html
      format.json { render json: @questions }
    end
  end

  def show
      @question = Question.find(params[:id])
  end

  def new
      @question = Question.new
  end

  def edit
     @question = Question.find(params[:id])
  end

  def create
      @question = Question.new(params[:question])
      render :action => :new unless @question.save
      
  end

  def update
      @question = Question.find(params[:id])
      render :action => :edit unless @question.update_attributes(params[:question])
  end

  def destroy
      @question = Question.find(params[:id])
      @question.destroy
     
  end  
end
