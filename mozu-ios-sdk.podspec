#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "mozu-ios-sdk"
  s.version          = "1.7.0"
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
  s.public_header_files = "MozuApi/*.h"
  s.source           = { :git => "https://github.com/Mozu/mozu-ios-sdk.git", :branch => "rabin" }
  # s.source           = { :path => '~/Documents/mozu-ios-sdk' }
  s.social_media_url = 'https://twitter.com/NAME'

  # s.platform     = :ios, '5.0'
  s.ios.deployment_target = '7.1'
  s.osx.deployment_target = '10.9'
  s.requires_arc = true

  s.header_mappings_dir = 'MozuApi'
  # s.header_dir = 'Classes'
  s.source_files = 'MozuApi/*.{m,h}'


  s.ios.exclude_files = 'MozuApi/osx'
  s.osx.exclude_files = 'MozuApi/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  s.dependency 'JSONModel'
  s.dependency 'CocoaLumberjack'

  s.subspec 'Cache' do |ss|
    ss.source_files = 'MozuApi/Cache/**/*.{m,h}'
  end

  s.subspec 'Clients' do |ss|
    ss.source_files = 'MozuApi/Clients/**/*.{m,h}'
  end

  s.subspec 'Contracts' do |ss|
    ss.source_files = 'MozuApi/Contracts/**/*.{m,h}'
  end

  s.subspec 'Resources' do |ss|
    ss.source_files = 'MozuApi/Resources/**/*.{m,h}'
  end

  s.subspec 'Security' do |ss|
    ss.source_files = 'MozuApi/Security/**/*.{m,h}'
  end

  s.subspec 'Urls' do |ss|
    ss.source_files = 'MozuApi/Urls/**/*.{m,h}'
  end

  s.subspec 'Utilities' do |ss|
    ss.source_files = 'MozuApi/Utilities/**/*.{m,h}'
  end

end
