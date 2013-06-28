if Rails.env.production?
  raise 'No storage strategy configured for production!'
else
  public_dir = Rails.root.join('public')
  store_dir  = File.join('uploads', Rails.env)
  Beatnode::Storage.use(:local, public_dir: public_dir, store_dir: store_dir)
end
