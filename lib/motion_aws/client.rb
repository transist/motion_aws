module AWS
  module S3
    class Client
      attr_accessor :key, :secret
      def initialize(options)
        self.key = options[:key]
        self.secret = options[:secret]
        self.client = AmazonS3Client.alloc.initWithAccessKey(self.key, withSecretKey: self.secret).autorelease
      end
    end
  end
end