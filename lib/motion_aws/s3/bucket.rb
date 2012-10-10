module AWS
  module S3
    class Bucket
      attr_accessor :endpoint, :name, :client
      def initialize(options)
        self.client = options[:client]
        self.name = options[:name]
        self.endpoint = self.client.endpoint 
      end
      
      def self.create(n=false)
        self.client.createBucket(S3CreateBucketRequest.alloc.initWithName((n ? n : self.name)).autorelease)
      end
    end
  end
end