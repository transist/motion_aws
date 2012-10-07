module AWS
  module S3
    class Base
      attr_accessor :key, :secret, :client, :bucket, :config
      def initialize
        self.config = AWS::S3::Config.init
        self.client = AWS::S3::Client.new(AmazonS3Client.alloc.initWithAccessKey(self.config.key, withSecretKey: self.config.secret).autorelease)
      end
    end
  end
end