module AWS
  module S3
    class Bucket
      attr_accessor :endpoint, :name
      def initialize(options)
        self.client = options[:client]
        self.name = options[:name]
        self.endpoint = self.client.endpoint 
      end
      
      def self.create(n=false)
        self.client.createBucket(S3CreateBucketRequest.alloc.initWithName((n ? n : self.name)).autorelease)
      end
      
      def delete
        self.client.deleteBucketWithName(self.name)
      end
      
      def get_location
        self.client.getBucketLocation(self.name)
      end
      
      def self.list
        self.client.listBuckets
      end
      
      def self.copy(source_key, source_bucket, destination_key, destination_bucket)
        obj = S3CopyObjectRequest.alloc.initWithSourceKey(source_key, sourceBucket: source_bucket, destinationKey: destination_key, destinationBucket: destination_bucket).autorelease
        self.client.copyObject(obj)
        obj.release
      end
      
      def self.list_objects
        self.client.listObjectsInBucket(self.name)
      end
    end
  end
end