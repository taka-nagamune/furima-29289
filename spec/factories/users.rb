FactoryBot.define do
  factory :user do
    nick_name             {Faker::JapaneseMedia::OnePiece.character}
    email                 {Faker::Internet.free_email}
    password              {"tt1111"}
    password_confirmation {password}
    first_name            {"あア阿"}
    last_name             {"あア阿"}
    first_name_kana       {Gimei::name.first.katakana}
    last_name_kana        {Gimei::name.last.katakana}
    birthday              {Faker::Date.birthday(min_age: 6, max_age: 90)}
  end
end