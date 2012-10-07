module AWS
  module S3
    class Config
      attr_accessor :key, :secret, :bucket
      
      def self.init
        s3_config = YAML.load_file('config/s3.yml')["development"]
        config = AWS::S3::Config.new
        config.bucket = s3_config["bucket"]
        config.key = s3_config["access_key_id"]
        config.secret = s3_config["secret_access_key"]
        config
      end
    end
  end
end