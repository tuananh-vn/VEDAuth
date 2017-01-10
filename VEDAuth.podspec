#
# Be sure to run `pod lib lint VEDAuth.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VEDAuth'
  s.version          = '0.1.0'
  s.summary          = 'A web browser module for your apps.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description  = <<-DESC
                   KINWebBrowser is a web browser module for your apps. Powered by WKWebView on iOS 8. Backwards compatible with iOS 7 using UIWebView. KINWebBrowser offers the simplest way to add a web browser to your apps.
                   DESC

  s.homepage         = 'https://github.com/tuananh-vn/VEDAuth'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tuananh' => 'viking8490@gmail.com' }
  s.source           = { :git => 'https://github.com/tuananh-vn/VEDAuth.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'VEDAuth/Classes/**/*'
  
  s.resources = 'VEDAuth/Assets/*.png'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'TUSafariActivity', '1.0.4'
  s.dependency 'ARChromeActivity', '1.0.5'
end
