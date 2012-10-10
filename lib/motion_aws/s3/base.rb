module AWS
  module S3
    class Base
      attr_accessor :client
      
      def initialize(client)
        self.client = client
      end
    end
  end
end