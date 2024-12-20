class ResponsesController < ApplicationController
  before_action :set_survey

  # Create a new response for a survey
  def create
    @response = @survey.responses.new(response_params)
    if @response.save
      render json: @response, status: :created
    else
      render json: { errors: @response.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Fetch all responses for a survey
  def index
    @responses = @survey.responses
    render json: @responses, status: :ok
  end

  # Update a specific response
  def update
    @response = @survey.responses.find_by(id: params[:id])
    if @response.nil?
      render json: { error: "Response not found" }, status: :not_found
    elsif @response.update(response_params)
      render json: @response, status: :ok
    else
      render json: { errors: @response.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Fetch all responses submitted by a user for a specific survey
  def user_responses
    @responses = @survey.responses.where(user_id: params[:user_id])
    render json: @responses, status: :ok
  end

  private

  # Find survey and handle missing records
  def set_survey
    @survey = Survey.find_by(id: params[:survey_id])
    render json: { error: "Survey not found" }, status: :not_found unless @survey
  end

  # Strong parameters for responses
  def response_params
    params.require(:response).permit(:user_id, answers: {})
  end
end
