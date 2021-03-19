FactoryBot.define do

  factory :user do
    first_name            {"ぜんかく"}
    first_name_kana       {"カタカナ"}
    last_name             {"ぜんかく"}
    last_name_kana        {"カタカナ"}
    nickname              {"aaa"}
    birth_day             {"1930-01-31"}
    email                 {"kkk@email.com"}
    password              {"123456"}
    password_confirmation {"123456"}
  end
end