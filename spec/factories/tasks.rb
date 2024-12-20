FactoryBot.define do
  factory :task do
    title { "Sample Task" }
    description { "This is a sample task." }
    status { "open" }
  end
end
