class AnswersController < ApplicationController
  def create
    question = Question.find_by(id: params[:question_id])
    @answer = question.answers.new(answer_params)
    if @answer.save
    else
      flash[:errors] = @answer.errors.full_messages
    end
    redirect_to question_path(question)
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :correct)
  end
end