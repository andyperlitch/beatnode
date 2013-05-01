require 'faker'

FactoryGirl.define do
  factory :user do
    username    { generate :username }
    provider_id { generate :provider_id }
  end

  factory :node do
    name { Faker::Name.name }
  end

  factory :connection do
    parent factory: :node
    child  factory: :node
  end

  sequence :username do |i|
    Faker::Internet.user_name + i.to_s
  end

  sequence :provider_id do |i|
    (hash.abs / i).to_s[0..5].to_i
  end
end
