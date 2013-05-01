require 'omniauth-soundcloud'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :soundcloud, ENV['BEATNODE_SOUNDCLOUD_ID'],
                        ENV['BEATNODE_SOUNDCLOUD_SECRET']
end
