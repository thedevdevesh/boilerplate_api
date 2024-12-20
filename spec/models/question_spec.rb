require 'rails_helper'

RSpec.describe Question, type: :model do
  it "is valid with valid attributes" do
    question = build(:question)
    expect(question).to be_valid
  end

  it "is invalid without content" do
    question = build(:question, content: nil)
    expect(question).to_not be_valid
  end

  it "belongs to a survey" do
    question = create(:question)
    expect(question.survey).to be_present
  end
end
