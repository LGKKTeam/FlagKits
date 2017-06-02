Pod::Spec.new do |s|
  s.name             = 'FlagKits'
  s.version          = '1.0.1'
  s.summary          = 'An easy way to handle with country flags picker.'
  s.description      = <<-DESC
  A simple lib for solving problem with choose a country flags, country codes, etc.
                       DESC

  s.homepage         = 'https://github.com/LGKKTeam/FlagKits'
  s.screenshots      = 'https://raw.githubusercontent.com/LGKKTeam/FlagKits/master/sample.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NguyenMinh' => 'https://github.com/nguyenminhkhmt' }
  s.source           = { :git => 'https://github.com/LGKKTeam/FlagKits.git', :branch => 'master', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'FlagKits/Classes/**/*.{h,m,swift}'
  s.resource = 'FlagKits/Assets/*.{png,jpg,jpeg,gif,xib,storyboard,bundle}'
  
  s.dependency 'Reusable'
  s.dependency 'libPhoneNumber-iOS'
end
