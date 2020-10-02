Pod::Spec.new do |s|
  s.name             = "UIKitTheme"
  s.summary          = "A short description of UIKitTheme."
  s.version          = "0.0.28"
  s.homepage         = "github.com/Strobocop/UIKitTheme"
  s.license          = 'MIT'
  s.author           = { "Brian Strobach" => "brian@appsaurus.io" }
  s.source           = {
    :git => "https://github.com/appsaurus/UIKitTheme.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/Strobocop'

  s.swift_version = '5.0'
  s.requires_arc = true

  s.dependency 'DynamicColor'
  s.dependency 'UIKitMixinable'
  s.dependency 'UIKitExtensions'
  s.dependency 'Swiftest'
  s.dependency 'DarkMagic'

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.2'
  s.watchos.deployment_target = "3.0"

  s.ios.source_files = 'Sources/{iOS,Shared}/**/*'
  s.tvos.source_files = 'Sources/{iOS,tvOS,Shared}/**/*'
  s.osx.source_files = 'Sources/{macOS,Shared}/**/*'
  s.watchos.source_files = 'Sources/{watchOS,Shared}/**/*'

  s.ios.frameworks = 'UIKit', 'Foundation', 'CoreGraphics'
  # s.osx.frameworks = 'Cocoa', 'Foundation'

end
