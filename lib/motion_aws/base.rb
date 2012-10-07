module AWS
  module S3
    class Base
      attr_accessor :key, :secret, :client, :bucket
      def initialize(options)
        self.key = options[:key]
        self.secret = options[:secret]
        self.bucket = options[:bucket]
        self.client = AWS::S3:Client.new(options)
      end
    end
  end
end