module AWS
  module S3
    class Endpoint
      def initialize(endpoint_sym)
        AWS::S3::Endpoint.endpoints[endpoint_sym]
      end
      
      def self.endpoints
        {:default => 's3.amazonaws.com', 's-west-1' => 's3-us-west-1.amazonaws.com', 'us-west-2' => 's3-us-west-2.amazonaws.com',
         'sa-east-1' => 's3.sa-east-1.amazonaws.com', 'eu-west-1' => 's3-eu-west-1.amazonaws.com', 
         'ap-southeast-1' => 's3-ap-southeast-1.amazonaws.com', 'ap-northeast-1' => 's3-ap-northeast-1.amazonaws.com'}
      end
    end
  end
end