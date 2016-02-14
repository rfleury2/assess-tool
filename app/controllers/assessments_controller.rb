class AssessmentsController < ApplicationController
  def new
    @assessment = Assessment.new
  end

  def create
    @assessment = current_user.assessments.new(assessment_params)
    if @assessment.save
      redirect_to assessment_add_questions_path(@assessment)
    else
      flash[:errors] = @assessment.errors.full_messages
      render :new
    end
  end

  def show
    @assessment = find_assessment
  end

  def add_questions
    @assessment = find_assessment
  end

  def assign_questions
    @assessment = find_assessment
    if @assessment.update_attributes(assessment_params)
      redirect_to assessment_path(@assessment)
    else
      redirect_to :back
    end
  end

  private

  def find_assessment
    Assessment.find_by(id: params[:assessment_id]) || Assessment.find_by(id: params[:id])
  end

  def assessment_params
    params.require(:assessment).permit(:title, question_ids:[])
  end
end
