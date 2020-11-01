#https://qiita.com/nysalor/items/94ecd53c2141d1c27d1f
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://172.22.0.1:6379' }
end