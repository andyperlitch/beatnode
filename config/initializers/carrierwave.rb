require 'carrierwave'

CarrierWave.configure do |config|
  config.store_dir = Rails.root.join 'uploads', Rails.env
end
