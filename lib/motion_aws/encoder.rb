module AWS
  class S3
    class Encoder
      def initialize(key, data)
        cKey  = key.cStringUsingEncoding(NSASCIIStringEncoding)
        cData = data.cStringUsingEncoding(NSASCIIStringEncoding)

        cHMAC[CC_SHA256_DIGEST_LENGTH]
        CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
        HMAC = NSData.alloc.initWithBytes(cHMAC, length:sizeof(cHMAC))

        
        hash = HMAC.base64Encoding
        hash
      end
    end
  end
end