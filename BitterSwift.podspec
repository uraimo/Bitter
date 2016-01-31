Pod::Spec.new do |s|
  s.name         = "BitterSwift"
  s.version      = "0.1.0"
  s.summary      = "The Swift (and Objective-C) testing framework."
  s.homepage     = "https://github.com/uraimo/BitterSwift"
  s.license      = { type: "MIT", file: "LICENSE" }
  s.author       = "Umberto Raimondi"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.tvos.deployment_target = '9.0'
  s.source       = { git: "https://github.com/uraimo/BitterSwift.git", tag: "v#{s.version}" }
  s.source_files = "Sources/BitterSwift/**/*.{swift,h}"
  s.framework = "XCTest"
end
