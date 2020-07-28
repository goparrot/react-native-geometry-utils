require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "goparrot-react-native-geometry-utils"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]
  s.swift_version = '5.0'
  s.static_framework = true

  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/goparrot/react-native-geometry-utils.git", :tag => "#{s.version}" }


  s.source_files = "ios/**/*.{h,m,mm,swift}"

  s.dependency "GoogleMaps"
  s.dependency "React"
end
