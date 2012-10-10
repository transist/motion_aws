require "motion_aws/version"

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'motion_aws/**/*.rb')).each do |file|
    app.files.unshift(file)
  end

  app.pods do
    pod 'AWSiOSSDK'
  end
end

require 'motion_aws/s3/base'
require 'motion_aws/s3/client'
require 'motion_aws/s3/bucket'
require 'motion_aws/s3/object'
require 'motion_aws/s3/endpoint'


module AWS
  module S3
  end
end

