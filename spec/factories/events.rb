FactoryBot.define do
  factory :event do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4) }
  	start_date { "2020-11-06 08:13:00" }
    end_date { "2020-11-06 09:13:00" }
  end
end
