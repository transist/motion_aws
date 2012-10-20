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
        begin
        self.client.createBucket(S3CreateBucketRequest.alloc.initWithName((n ? n : self.name)).autorelease)
        rescue => e
          
        end
      end
    end
  end
end