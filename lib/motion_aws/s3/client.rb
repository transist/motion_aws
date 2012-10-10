module AWS
  module S3
    class Client
      attr_accessor :key, :secret, :client, :bucket, :endpoint
      
      def initialize(options)
        self.key = options[:key]
        self.secret = options[:secret]
        self.bucket = options[:bucket]
        self.client = AmazonS3Client.alloc.initWithAccessKey(self.key, withSecretKey: self.secret).autorelease
        self.client.endpoint = self.endpoint = endpoint_from_options(options[:endpoint])
      end
      
      def create_bucket(name) 
        self.client.createBucket(S3CreateBucketRequest.alloc.initWithName(name).autorelease)
      end
      
      def endpoint_from_options(endpoint)
        (endpoint ? AWS::S3::Endpoint.new(endpoint) : 'https://s3.amazonaws.com')
      end
    end
  end
end