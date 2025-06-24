#
# Be sure to run `pod lib lint MDWSetModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MDWSetModule'
  s.version          = '0.0.3'
  s.summary          = 'A short description of MDWSetModule.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Feex@2023eit/MDWSetModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Feex@2023eit' => '7096397474@qq.com' }
  s.source           = { :git => 'git@github.com:kakaxi1206/MDWSetModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.resources = 'MDWSetModule/Assets/*.{png,jpeg,jpg,gif,bundle}'

  s.ios.deployment_target = '10.0'

  s.source_files = 'MDWSetModule/Classes/**/*'
  
  s.dependency 'MJExtension'
  s.dependency 'MDBUIModule'
  s.dependency 'MDBMethodExtendModule'
  s.dependency 'MDBMarcoModule'
  s.dependency 'MDProgressHUD'
  s.dependency 'MDBNetWorkModule'
  s.dependency 'MDLoginCategory'
  s.dependency 'MDWLoginModule'


  # s.resource_bundles = {
  #   'MDWSetModule' => ['MDWSetModule/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
