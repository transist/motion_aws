module AWS
  module S3
    class Base
      attr_accessor :client
      
      def initialize(client)
        self.client = client
      end
      
      def endpoint_from_options(endpoint)
        (endpoint ? AWS::S3::Endpoint.new(endpoint) : 'https://s3.amazonaws.com')
      end
    end
  end
end