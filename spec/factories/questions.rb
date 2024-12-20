FactoryBot.define do
  factory :question do
    survey
    content { "What is your name?" }
  end
end
