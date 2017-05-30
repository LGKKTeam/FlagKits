Pod::Spec.new do |s|
  s.name             = 'FlagKits'
  s.version          = '1.0.0'
  s.summary          = 'An eazy way to handle with nation picker.'
  s.description      = <<-DESC
  A simple class to solve problem when choose a nation flag, country code, etc.
                       DESC

  s.homepage         = 'https://github.com/LGKKTeam/FlagKits'
  # s.screenshots    = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nguyenminhkhmt@gmail.com' => 'nguyenminhkhmt@gmail.com' }
  s.source           = { :git => 'https://github.com/LGKKTeam/FlagKits.git', :branch => 'master', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'FlagKits/Classes/**/*.{h,m,swift}'

  s.resource_bundles = {
      'FlagKits' => ['FlagKits/Assets/*.{png,jpg,jpeg,gif,xib,storyboard,bundle}']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  s.dependency 'Reusable'
  s.dependency 'libPhoneNumber-iOS'
end
