Pod::Spec.new do |s|
  s.name         = "Bitter"
  s.version      = "5.0.0"
  s.summary      = "The Swift bits manipulation toolkit"
  s.homepage     = "https://github.com/uraimo/Bitter"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.social_media_url = "http://twitter.com/uraimo"
  s.author       = "Umberto Raimondi"
  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.9"
  s.swift_version = "5.0"
  s.source       = { :git => "https://github.com/uraimo/Bitter.git", :tag => s.version.to_s }
  s.source_files = "Sources/Bitter/**/*.{swift,h}"
  
end
