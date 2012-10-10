module AWS
  module S3
    class Bucket
      attr_accessor :endpoint, :name
      def initialize(options)
        self.client = options[:client]
        self.name = options[:name]
        self.endpoint = self.client.endpoint 
      end
      
      def create
        response = self.client.createBucket(S3CreateBucketRequest.alloc.initWithName(self.name).autorelease)
      end
      
      def delete
        response = self.client.deleteBucketWithName(self.name)
      end
      
      def get_location
        response = self.client.getBucketLocation(self.name)
      end
      
      def list
        response = self.client.listBuckets
      end
      
      def copy(source_key, source_bucket, destination_key, destination_bucket)
        obj = S3CopyObjectRequest.alloc.initWithSourceKey(source_key, sourceBucket: source_bucket, destinationKey: destination_key, destinationBucket: destination_bucket).autorelease
        self.client.copyObject(obj)
        response = obj.release
      end
      
      def list_objects
        response = self.client.listObjectsInBucket(self.name)
      end
    end
  end
end