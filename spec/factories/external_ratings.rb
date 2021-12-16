FactoryBot.define do
  factory :external_rating do
    movie_id { 1 }
    source_name { "MyString" }
    rating { 1.5 }
  end
end
