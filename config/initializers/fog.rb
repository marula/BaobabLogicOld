S3_CONFIG = YAML.load_file("#{::Rails.root}/config/s3.yml")

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',    
    :aws_access_key_id      => S3_CONFIG[::Rails.env]["access_key_id"],                        
    :aws_secret_access_key  => S3_CONFIG[::Rails.env]["secret_access_key"],                        
    :region                 => 'eu-west-1',
  }
  config.fog_directory  = S3_CONFIG[::Rails.env]["bucket"]
end
