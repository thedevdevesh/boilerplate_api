class SurveysController < ApplicationController
  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      render json: @survey, status: :created
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description, questions_attributes: [ :content ])
  end
end
