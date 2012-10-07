require "motion_aws/version"

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'foo/*.rb')).each do |file|
    app.files.unshift(file)
  end
  app.pods do
    pod 'AWSiOSSDK'
  end
end

module AWS
  
end
