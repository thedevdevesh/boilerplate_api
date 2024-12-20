describe 'POST /surveys/:survey_id/responses' do
  context 'with valid parameters' do
    it 'creates a new response' do
      survey = create(:survey)
      post "/surveys/#{survey.id}/responses", params: { response: { user_id: 1, answers: { "question_1" => "Answer 1" } } }

      expect(response).to have_http_status(:created)
      expect(json['answers']).to include("question_1" => "Answer 1")
    end
  end

  context 'with invalid parameters' do
    it 'returns an error message' do
      survey = create(:survey)
      post "/surveys/#{survey.id}/responses", params: { response: { user_id: 1, answers: nil } }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(json['errors']).to include("answers can't be blank")
    end
  end
end

describe 'GET /surveys/:survey_id/responses' do
  it 'returns all responses for a survey' do
    survey = create(:survey)
    create(:response, survey: survey)
    get "/surveys/#{survey.id}/responses"

    expect(response).to have_http_status(:ok)
    expect(json.size).to eq(1)
  end
end

describe 'GET /surveys/:survey_id/responses/user_responses' do
  it 'returns responses submitted by a user for a survey' do
    survey = create(:survey)
    create(:response, survey: survey, user_id: 1)
    get "/surveys/#{survey.id}/responses/user_responses", params: { user_id: 1 }

    expect(response).to have_http_status(:ok)
    expect(json.size).to eq(1)
  end
end
