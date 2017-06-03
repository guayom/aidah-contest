FactoryGirl.define do
  factory :subscriber do
    email "MyString"
    name "MyString"
    tel 1
    category "MyString"
    country "MyString"
  end
  factory :participant_rating do
    participant nil
    category nil
    parameter nil
    score 1
  end
  factory :vote do
    participant_id 1
  end
  factory :category do
    title "MyString"
  end
  factory :group do
    name "MyString"
  end
  factory :parameter do
    title "MyString"
  end
  factory :jury do
    name "MyString"
    email "MyString"
    bio "MyText"
  end
  factory :participant do
    name "MyString"
    email "MyString"
    lastname "MyString"
    lastname2 "MyString"
    tel "MyString"
    bio "MyText"
  end
  factory :user do
    
  end
end
