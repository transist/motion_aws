module AWS
  module S3
    class Base
      attr_accessor :key, :secret, :client, :bucket
      def initialize(options={})
        self.key = options[:key] || AWS::S3::Config.key
        self.secret = options[:secret] || AWS::S3::Config.secret
        self.bucket = options[:bucket] || AWS::S3::Config.bucket
        self.client = AWS::S3::Client.new(AmazonS3Client.alloc.initWithAccessKey(self.key, withSecretKey: self.secret).autorelease)
      end
    end
  end
end