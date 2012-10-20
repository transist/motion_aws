module AWS
  module S3
    class Endpoint
      attr_accessor :name, :url, :domain 
      def initialize(endpoint=:default)
        self.name = endpoint
        self.domain = AWS::S3::Endpoint.endpoints[endpoint]
        self.url = self.with_protocol
      end
      
      def self.endpoints
        {:default => 's3.amazonaws.com', 'us-west-1' => 's3-us-west-1.amazonaws.com', 'us-west-2' => 's3-us-west-2.amazonaws.com',
         'sa-east-1' => 's3.sa-east-1.amazonaws.com', 'eu-west-1' => 's3-eu-west-1.amazonaws.com', 
         'ap-southeast-1' => 's3-ap-southeast-1.amazonaws.com', 'ap-northeast-1' => 's3-ap-northeast-1.amazonaws.com',
         :san_francisco => 's3-us-west-1.amazonaws.com', :oregon => 's3-us-west-2.amazonaws.com',
         :brazil => 's3.sa-east-1.amazonaws.com', :europe => 's3-eu-west-1.amazonaws.com', 
         :singapore => 's3-ap-southeast-1.amazonaws.com', :japan => 's3-ap-northeast-1.amazonaws.com'}
      end
      
      def self.endpoint_classes
        {:default => S3Region.USStandard, 'us-west-1' => S3Region.USWest, 'us-west-2' => S3Region.USWest2,
         'sa-east-1' => S3Region.SASaoPaulo, 'eu-west-1' => S3Region.EUIreland, 
         'ap-southeast-1' => S3Region.APSingapore, 'ap-northeast-1' => S3Region.APJapan,
         :san_francisco => S3Region.USWest, :oregon => S3Region.USWest2,
         :brazil => S3Region.SASaoPaulo, :europe => S3Region.EUIreland, 
         :singapore => S3Region.APSingapore, :japan => S3Region.APJapan}
      end
      
      def with_protocol(protocol='https')
        protocol + '://' + self.domain
      end
    end
  end
end