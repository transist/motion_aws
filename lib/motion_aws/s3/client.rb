module AWS
  module S3
    class Client
      attr_accessor :key, :secret, :client, :endpoint, :creds, :endpoint_class, :bucket
      
      def initialize(options)
        self.key = options[:key]
        self.secret = options[:secret]
        self.creds = AmazonCredentials.alloc.initWithAccessKey(self.key, withSecretKey: self.secret)
        self.client = AmazonS3Client.alloc.initWithCredentials(self.creds)
        self.endpoint = options[:endpoint]
        self.bucket = options[:bucket]
      end
      
      def create_bucket(name=self.bucket) 
        req = S3CreateBucketRequest.alloc.initWithName(name).autorelease  
        req.region = AWS::S3::Endpoint.endpoint_classes[self.endpoint]
        self.client.createBucket(req)
      end
      
      def delete_bucket(name=self.bucket)
        req = S3DeleteBucketRequest.alloc.initWithName(name).autorelease    
        self.client.deleteBucket(req)
      end
      
      def put_object(path_name, data, content_type="image/jpeg")
        object_request = S3PutObjectRequest.alloc.initWithKey(path_name, inBucket: self.bucket)
        object_request.contentType = content_type
        object_request.data = data                 
        self.client.putObject(object_request)
      end
      
      def delete_object(path_name, data, content_type="image/jpeg")
        object_request = S3PutObjectRequest.alloc.initWithKey(path_name, inBucket: self.bucket)
        object_request.contentType = content_type
        object_request.data = data                 
        self.client.putObject(object_request)
      end
    end
  end
end