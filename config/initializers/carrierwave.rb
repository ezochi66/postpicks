require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'IAM登録で取得したアクセスキー',
      aws_secret_access_key: 'IAM登録で取得したシークレットアクセスキー',
      region: 'smoozypicks'  # S3バケット作成時に指定したリージョン。左記は東京を指す
    }
    config.fog_directory  = 's3-rails-image-uploader' # 作成したS3バケット名
  end
  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end 