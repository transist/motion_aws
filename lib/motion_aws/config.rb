module AWS
  module S3
    class Config
      attr_accessor :key, :secret, :container
      
      def initialize(options={})
        if options == {}
          s3_config = YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), '../config/s3.yml')))["development"]
          puts s3_config
          self.container = s3_config["bucket"]
          self.key = s3_config["access_key_id"]
          self.secret = s3_config["secret_access_key"]
        end
      end
    end
  end
end