require 'rails_helper'

RSpec.describe Response, type: :model do
  it "is valid with valid attributes" do
    response = build(:response)
    expect(response).to be_valid
  end

  it "is invalid without a user_id" do
    response = build(:response, user_id: nil)
    expect(response).to_not be_valid
  end

  it "is invalid without answers" do
    response = build(:response, answers: nil)
    expect(response).to_not be_valid
  end

  it "belongs to a survey" do
    response = create(:response)
    expect(response.survey).to be_present
  end
end
