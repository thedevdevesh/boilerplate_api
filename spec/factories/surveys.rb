FactoryBot.define do
  factory :survey do
    title { "Test Survey" }
    description { "This is a description" }

    factory :survey_with_questions do
      after(:create) do |survey|
        create(:question, survey: survey)
      end
    end
  end
end
