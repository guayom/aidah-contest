FactoryGirl.define do
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
