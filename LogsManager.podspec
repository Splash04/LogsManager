#
# Be sure to run `pod lib lint LogsManager.podspec` to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LogsManager'
  s.version          = '13.0.0'
  s.summary          = 'Logs manager on top of CocoaLumberjack.'

  s.description      = <<-DESC
Logs manager on top of CocoaLumberjack. Allows to easily configure log components depending on your app infrastucture. Have several convenience loggers: ConsoleLogger, AlertLogger, NotificationLogger.
                       DESC

  s.homepage         = 'https://github.com/APUtils/LogsManager'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Anton Plebanovich' => 'anton.plebanovich@gmail.com' }
  s.source           = { :git => 'https://github.com/APUtils/LogsManager.git', :tag => s.version.to_s }
  
  s.frameworks = 'Foundation'
  s.swift_versions = ['5']
  
  # 1.12.0: Ensure developers won't hit CocoaPods/CocoaPods#11402 with the resource
  # bundle for the privacy manifest.
  # 1.13.0: visionOS is recognized as a platform.
  s.cocoapods_version = '>= 1.13.0'
  
  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.13'
  s.tvos.deployment_target = '11.0'
  s.watchos.deployment_target = '4.0'
  
  s.dependency 'APExtensions/Occupiable', '>= 10.1.6'
  s.dependency 'CocoaLumberjack/Swift', '>= 3.7.2'
  s.dependency 'RoutableLogger', '>= 11.0.0'
  s.default_subspec = 'ExtensionUnsafe'
  
  s.subspec 'Core' do |subspec|
      subspec.ios.deployment_target = '11.0'
      subspec.osx.deployment_target = '10.13'
      subspec.watchos.deployment_target = '4.0'
      subspec.tvos.deployment_target = '11.0'
      subspec.source_files = 'LogsManager/Classes/**/*', 'LogsManager/Shared/**/*'
      subspec.resource_bundle = {"LogsManager.Core.privacy"=>"LogsManager/Privacy/LogsManager.Core/PrivacyInfo.xcprivacy"}
  end
  
  s.subspec 'ExtensionUnsafe' do |subspec|
      subspec.ios.deployment_target = '11.0'
      subspec.source_files = 'LogsManager/ExtensionUnsafeClasses/**/*', 'LogsManager/Classes/**/*', 'LogsManager/Shared/**/*'
      subspec.resource_bundle = {"LogsManager.ExtensionUnsafe.privacy"=>"LogsManager/Privacy/LogsManager.ExtensionUnsafe/PrivacyInfo.xcprivacy"}
  end

end
