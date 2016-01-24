class AnswersController < ApplicationController
  def create
    question = Question.find_by(id: params[:question_id])
    @answer = question.answers.new(answer_params)
    if @answer.save
      return render @answer
    else
      flash[:errors] = @answer.errors.full_messages
      return render partial: 'shared/errors', status: 203
    end
  end

  def destroy
    answer = Answer.find_by(id: params[:id])
    if answer.try(:destroy)
      return render nothing: true, status: 200
    else
      return render nothing: true, status: 400
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :correct)
  end
end