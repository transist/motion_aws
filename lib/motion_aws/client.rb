module AWS
  module S3
    class Client
      attr_accessor :client
      def initialize(client)
        self.client = client
      end
      
      def create_bucket(name, &block)
        block.call(self.client.createBucket(S3CreateBucketRequest.alloc.initWithName(name).autorelease))
      end
      
      def list_bucket(bucket)
        listObjectRequest = S3ListObjectsRequest.alloc.initWithName(bucket).autorelease
        listObjectResponse = AmazonClientManager(self.client).listObjects(listObjectRequest)
        listObjectsResults = listObjectResponse.listObjectsResult
        listObjectsResults.objectSummaries.each do |objectSummary|
          p objectSummary.key
        end
      end
      
      def put_object(bucket, data, filename, content_type, &block)
        obj = S3PutObjectRequest.alloc.initWithKey(filename, inBucket: bucket).autorelease
        obj.contentType = content_type
        obj.data = data;
        block.call(self.client.putObject(obj))
      end
    end
  end
end