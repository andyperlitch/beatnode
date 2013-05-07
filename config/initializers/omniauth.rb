require 'omniauth-soundcloud'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :soundcloud, ENV['BEATNODE_SOUNDCLOUD_ID'],
                        ENV['BEATNODE_SOUNDCLOUD_SECRET']
end
