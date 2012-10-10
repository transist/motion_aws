module AWS
  module S3
    class Object
      attr_accessor :client, :path, :content_type, :data, :bucket, :delegator
      
      def initialize(client, options)
        self.client       = client.client
        self.bucket       = client.bucket
        self.path         = options[:path]
        self.content_type = options[:content_type]
        self.data         = options[:data]
        self.delegator    = options[:delegate]
      end
      
      def put
        obj = S3PutObjectRequest.alloc.initWithKey(self.path, inBucket: self.bucket).autorelease
        obj.contentType = self.content_type
        obj.data = self.data
        obj.delegate = self.delegator
        self.client.putObject(obj)
        obj.release
      end
      
      def move(new_path)
        
      end
      
      def copy(source_key, source_bucket, destination_key, destination_bucket)
        obj = S3CopyObjectRequest.alloc.initWithSourceKey(source_key, sourceBucket: source_bucket, destinationKey: destination_key, destinationBucket: destination_bucket).autorelease
        self.client.deleteObject(obj)
        obj.release
      end
      
      def delete
        obj = S3DeleteObjectRequest.alloc.initWithKey(self.path, inBucket: self.bucket).autorelease
        self.client.deleteObject(obj)
        obj.release
      end
    end
  end
end