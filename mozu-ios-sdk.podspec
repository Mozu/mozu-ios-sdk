#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "mozu-ios-sdk"
  s.version          = "0.1.0"
  s.summary          = "A short description of mozu-ios-sdk."
  s.description      = <<-DESC
                       An optional longer description of mozu-ios-sdk

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "http://EXAMPLE/NAME"
  s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Noel Artiles" => "noel_artiles@volusion.com" }
  # s.source           = { :git => "http://EXAMPLE/NAME.git", :tag => s.version.to_s }
  s.source           = { :path => '~/Documents/mozu-ios-sdk' }
  s.social_media_url = 'https://twitter.com/NAME'

  # s.platform     = :ios, '5.0'
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.requires_arc = true

  s.header_mappings_dir = 'MozuApi'
  # s.header_dir = 'Classes'
  s.source_files = 'MozuApi/**/*.{m,h}'


  s.ios.exclude_files = 'MozuApi/osx'
  s.osx.exclude_files = 'MozuApi/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  s.dependency 'JSONModel'
end
