require "motion_aws/version"

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'motion_aws/*.rb')).each do |file|
    app.files.unshift(file)
  end

  app.vendor_project(File.expand_path(File.join(File.dirname(__FILE__), '../vendor/aws-ios-sdk-1.4.2/AWSiOSSDK.framework')), :static, :products => ['AWSiOSSDK'], :headers_dir => 'Headers')
end

module AWS
  module S3
  end
end

require 'motion_aws/config'

['encoder', 'client', 'base'].each do |file|
  require 'motion_aws/'+file
end

