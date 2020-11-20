require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_DEFAULT_REGION'],
    path_style: true
  }
  config.fog_directory  = ENV['S3_BUCKET']
  # config.fog_directory  = 'AWSで作成したバケット名'
  case Rails.env
  when 'development'
      config.fog_directory  = 'smoozypicks'
      # config.asset_host = 'https://s3.amazonaws.com/smoozypicks'
      config.asset_host = 'https://smoozypicks.s3-ap-northeast-1.amazonaws.com'
  when 'production'
      config.fog_directory  = 'smoozypicks'
      # config.asset_host = 'https://s3.amazonaws.com/smoozypicks'
      config.asset_host = 'https:///smoozypicks.s3-ap-northeast-1.amazonaws.com'
  end
end