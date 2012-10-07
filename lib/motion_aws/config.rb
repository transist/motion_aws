module AWS
  module S3
    class Config
      def self.key=(a)
       @@key =  a
      end 

      def self.key
       @@key
      end

      def self.secret=(c)
       @@callback =  c
      end

      def self.secret
       @@callback
      end

      def self.bucket=(c)
       @@bucket =  c
      end

      def self.bucket
       @@bucket
      end
    end
  end
end