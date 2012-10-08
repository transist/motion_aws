module AWS
  module S3
    class Bucket < Base
      attr_accessor :endpoint, :name
      def initialize(options)
        self.client = options[:client]
        self.name = options[:name]
        self.endpoint = self.client.endpoint 
      end
      
      def self.create(name)
        self.client.createBucket(S3CreateBucketRequest.alloc.initWithName(name).autorelease)
      end
    end
  end
end