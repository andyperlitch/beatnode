require 'faker'
require 'digest'
require 'rack/test'

FactoryGirl.define do
  to_create { |model| model.save }

  factory :user do
    username    { generate :username }
    provider_id { generate :provider_id }
    provider_name 'soundcloud'
  end

  factory :sound do
    title { Faker::Name.name }
  end

  factory :upload do
    user  factory: :user
    sound factory: :sound
    sha1 { generate(:sha1) }
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

  sequence :sha1 do |i|
    Digest::SHA1.hexdigest(i.to_s)
  end

  mp3_path = Rails.root.join('spec', 'fixtures', 'audio', 'test.mp3')

  sequence :mp3 do
    File.new(mp3_path, 'rb')
  end

  sequence :file_upload do
    # Hack, will be fixed by patch:
    # https://github.com/brynary/rack-test/commit/1b1e7308668391ac7498d67eb1927978f7634603
    Rack::Test::UploadedFile.new(mp3_path).tap do |f|
      class << f
        attr_reader :tempfile
      end
    end
  end
end
