CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/"
  config.storage = :fog
  config.permissions = 0666
  #config.fog_public = false
  #config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
  config.fog_credentials = {
      :provider => 'AWS', # required
      :aws_access_key_id => ENV['S3_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET'],
      region: 'eu-west-1'
  }
  config.fog_directory = ENV['S3_BUCKET_NAME']
end