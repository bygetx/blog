FactoryBot.define do
  factory :user do
    first_name { 'Aymen' }
    last_name { 'Mehrez' }
    username { 'Bygetx' }
    email { 'mehrezaymen0@gmail.com' }
    password { 'test1234' }
    password_confirmation { 'test1234' }
  end
end
