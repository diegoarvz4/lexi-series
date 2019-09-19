if Rails.env.production?
 CarrierWave.configure do |config|
   config.fog_provider = 'fog/aws'
   config.fog_credentials = {
     # Configuration for Amazon S3
     :provider              => 'AWS',
     :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
     :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
     :region                => ENV['S3_REGION']  
   }
   config.fog_directory     =  ENV['S3_BUCKET_NAME']
   
 end
end