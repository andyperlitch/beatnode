require 'faker'

FactoryGirl.define do
  to_create { |model| model.save }

  factory :user do
    username    { generate :username }
    provider_id { generate :provider_id }
    provider_name 'soundcloud'
  end

  factory :sound do
    uploader factory: :user
    title { Faker::Name.name }
  end

  factory :sampling do
    source factory: :sound
    result factory: :sound
  end

  factory :collaboration do
    source  factory: :user
    subject factory: :user
  end

  factory :crating do
    owner factory: :user
    sound
  end

  sequence :username do |i|
    Faker::Internet.user_name + i.to_s
  end

  sequence :provider_id do
    Faker::Address.zip.to_i
  end
end
