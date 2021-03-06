class QuestionsController < ApplicationController
  before_filter :require_login

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
    @question = Question.find_by(id: params[:id])
    @question.destroy
    redirect_to dashboard_path
  end 

  # submits a question for approval from draft
  def finish
    # TODO: extract to service object when this gets bigger.  
    # TODO: extract questions model finish as a concern
    @question = Question.find_by(id: params[:question_id])
    if @question.has_correct_answer?
      flash[:success] = "Question saved successfully!"
      redirect_to dashboard_path
    else
      # flash[:errors] = ["No correct answer selected.  Try again."]
      render :show
    end
  end

  private

  def question_params
    params.require(:question).permit(:prompt)
  end
end