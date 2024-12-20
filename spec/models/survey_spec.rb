require 'rails_helper'

RSpec.describe Survey, type: :model do
  it "is valid with valid attributes" do
    survey = build(:survey)
    expect(survey).to be_valid
  end

  it "is invalid without a title" do
    survey = build(:survey, title: nil)
    expect(survey).to_not be_valid
  end

  it "can have many questions" do
    survey = create(:survey_with_questions)
    expect(survey.questions.count).to eq(3)
  end

  it "can have many responses" do
    survey = create(:survey)
    expect(survey.responses.count).to eq(1)
  end
end
