require 'faker'

FactoryGirl.define do
  to_create { |model| model.save }

  factory :user do
    username    { generate :username }
    provider_id { generate :provider_id }
    provider_name 'soundcloud'
  end

  factory :node do
    uploader factory: :user
    title { Faker::Name.name }
  end

  factory :sampling do
    source factory: :node
    result factory: :node
  end

  factory :collaboration do
    source  factory: :user
    subject factory: :user
  end

  sequence :username do |i|
    Faker::Internet.user_name + i.to_s
  end

  sequence :provider_id do
    Faker::Address.zip.to_i
  end
end
