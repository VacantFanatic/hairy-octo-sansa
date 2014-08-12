# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :data_stream do
    name "MyString"
    csdl "MyString"
    active false
  end
end
