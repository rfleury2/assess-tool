class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      flash[:errors] = @question.errors.full_messages
      render :new
    end
  end

  def show
    flash[:errors] = nil
    @question = Question.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end 

  private

  def question_params
    params.require(:question).permit(:prompt)
  end
end