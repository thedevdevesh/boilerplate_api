FactoryBot.define do
  factory :response do
    survey
    user_id { 1 }
    answers { { "question_1" => "Answer 1" } }
  end
end
