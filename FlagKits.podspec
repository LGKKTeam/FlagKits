#
# Be sure to run `pod lib lint FlagKits.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FlagKits'
  s.version          = '1.0.0'
  s.summary          = 'An eazy way to handle with nation picker.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A simple class to solve problem when choose a nation flag, country code, etc.
                       DESC

  s.homepage         = 'https://github.com/nguyenminhkhmt@gmail.com/FlagKits'
  # s.screenshots    = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nguyenminhkhmt@gmail.com' => 'nguyenminhkhmt@gmail.com' }
  s.source           = { :git => 'https://github.com/nguyenminhkhmt@gmail.com/FlagKits.git', :branch => 'master', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'FlagKits/Classes/**/*'
  
    s.resource_bundles = {
        'FlagKits' => ['FlagKits/Assets/*.{png,jpg,jpeg,gif,xib,storyboard}']
    }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
