describe 'POST /surveys' do
  context 'with valid parameters' do
    it 'creates a new survey' do
      post '/surveys', params: { survey: { title: 'Test Survey', description: 'A test survey' } }

      expect(response).to have_http_status(:created)
      expect(json['title']).to eq('Test Survey')
    end
  end

  context 'with invalid parameters' do
    it 'returns an error message' do
      post '/surveys', params: { survey: { title: '', description: 'A test survey' } }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(json['title']).to include("can't be blank")
    end
  end
end
