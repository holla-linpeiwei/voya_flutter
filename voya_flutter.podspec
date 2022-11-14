#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint voya_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'voya_flutter'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter project.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'https://github.com/holla-linpeiwei/voya_flutter'
  s.license          = { :file => 'LICENSE' }
  s.author           = { 'Your Company' => 'peiwei.lin@holla.world' }
  s.source           = { :git => 'https://github.com/holla-linpeiwei/voya_flutter.git', :tag => s.version.to_s  }
  s.source_files = 'voya_flutter/Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
