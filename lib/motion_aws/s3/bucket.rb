module AWS
  module S3
    class Bucket
      attr_accessor :endpoint, :name
      def initialize(options)
        self.endpoint = options[:endpoint]
        self.name = options[:name]
      end
      
      def self.create(name)
        self.client.createBucket(S3CreateBucketRequest.alloc.initWithName(name).autorelease)
      end
    end
  end
end