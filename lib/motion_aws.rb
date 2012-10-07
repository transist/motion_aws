require "motion_aws/version"

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'foo/*.rb')).each do |file|
    app.files.unshift(file)
  end
  app.vendor_project(File.expand_path(File.join(File.dirname(__FILE__), '../vendor/aws-ios-sdk-1.4.2/AWSiOSSDK.framework')), :static, :products => ['AWSiOSSDK'], :headers_dir => 'Headers')
  app.vendor_project(File.expand_path(File.join(File.dirname(__FILE__), '../vendor/aws-ios-sdk-1.4.2/AWSPersistence.framework')), :static, :products => ['AWSPersistence'], :headers_dir => 'Headers')
end

module AWS
  
end
