#
# Be sure to run `pod lib lint mozu-ios-sdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "mozu-ios-sdk"
  s.version          = "1.18.15266.2"
  s.summary          = "Objective-C API for connecting to Mozu web services."
  s.description      = <<-DESC
The Mozu iOS SDK exposes the complete functionality of the Mozu REST API enabling you to create robust Mozu applications on the iOS platform
                       DESC

  s.homepage         = "https://github.com/Mozu/mozu-ios-sdk.git"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "rabin-joshi-volusion" => "rabin_joshi@volusion.com" }
s.source           = { :git => "https://github.com/Mozu/mozu-ios-sdk.git", :tag => "v1.18.15266.2" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'mozu-ios-sdk/Classes/**/*'
  s.resource_bundles = {
    'mozu-ios-sdk' => ['mozu-ios-sdk/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
