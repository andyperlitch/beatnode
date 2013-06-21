if Rails.env.production?
  raise 'No storage strategy configured for production!'
else
  store_dir = Rails.root.join('uploads', Rails.env)
  Beatnode::Storage.use(:local, :store_dir => store_dir)
end
