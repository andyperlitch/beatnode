if Rails.env.production?
  raise 'No storage strategy configured for production!'
else
  store_dir = File.join('uploads', Rails.env)
  Beatnode::Storage.use(:local, store_dir: store_dir)
end
