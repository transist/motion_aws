module AWS
  module S3
    class Client
      attr_accessor :client
      
      def initialize(client)
        self.client = client
      end
      
      def create_bucket(name)
        self.client.createBucket(S3CreateBucketRequest.alloc.initWithName(name).autorelease)
      end
      
      # def delete_bucket(name)
      #   self.client.createBucket(S3CreateBucketRequest.alloc.initWithName(name).autorelease)
      # end
      
      # def rename_bucket(name)
      #   self.client.createBucket(S3CreateBucketRequest.alloc.initWithName(name).autorelease)
      # end
      
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