module AWS
  module S3
    class Client
      attr_accessor :key, :secret, :client, :bucket, :endpoint
      
      def initialize(client)
        self.key = options[:key]
        self.secret = options[:secret]
        self.bucket = options[:bucket]
        self.client = AWS::S3::Client.new(AmazonS3Client.alloc.initWithAccessKey(self.key, withSecretKey: self.secret).autorelease)
        self.client.endpoint = self.endpoint = (options[:endpoint] ? options[:endpoint] : 'https://s3.amazonaws.com')
      end
      
      def put_object(bucket, data, filename, content_type, d)
        obj = S3PutObjectRequest.alloc.initWithKey(filename, inBucket: bucket).autorelease
        obj.contentType = content_type
        obj.data = data
        obj.delegate = d
        self.client.putObject(obj)
        obj.release
      end
      
      def move_object(bucket, filename, new_filename, d)
        
      end
      
      def delete_object(bucket, filename, d)
        
      end
    end
  end
end