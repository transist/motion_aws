module AWS
  module S3
    class Base
      attr_accessor :key, :secret, :client
      def initialize(options)
        self.key = options[:key]
        self.secret = options[:secret]
        self.client = AmazonS3Client.alloc.initWithAccessKey(self.key, withSecretKey: self.secret).autorelease
      end
    end
  end
end