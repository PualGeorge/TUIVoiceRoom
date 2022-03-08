Pod::Spec.new do |spec|
  spec.name         = 'TUIVoiceRoom'
  spec.version      = '1.0.0'
  spec.platform     = :ios
  spec.ios.deployment_target = '11.0'
  spec.license      = { :type => 'Proprietary',
      :text => <<-LICENSE
        copyright 2017 tencent Ltd. All rights reserved.
        LICENSE
       }
  spec.homepage     = 'https://cloud.tencent.com/document/product/269/3794'
  spec.documentation_url = 'https://cloud.tencent.com/document/product/269/9147'
  spec.authors      = 'tencent video cloud'
  spec.summary      = 'TUIVoiceRoom'
  spec.xcconfig     = { 'VALID_ARCHS' => 'armv7 arm64 x86_64' }
  spec.swift_version = '5.0'

  spec.dependency 'Alamofire'
  spec.dependency 'SnapKit'
  spec.dependency 'Toast-Swift'
  spec.dependency 'Kingfisher'
  spec.dependency 'MJRefresh'
  spec.dependency 'MJExtension'
  spec.dependency 'TXAppBasic'
  spec.dependency 'TXIMSDK_Plus_iOS', '~> 5.7.1435'

  spec.requires_arc = true
  spec.static_framework = true
  spec.source = { :path => './'}
  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

 spec.default_subspec = 'TRTC'
 spec.subspec 'TRTC' do |trtc|
   trtc.pod_target_xcconfig = { 'HEADER_SEARCH_PATHS' => '${PODS_TARGET_SRCROOT}/../../SDK/TXLiteAVSDK_TRTC.framework/Headers/'}
   trtc.dependency 'TXLiteAVSDK_TRTC'
   trtc.source_files = 'Source/Localized/**/*.{h,m,mm,swift}', 'Source/model/**/*.{h,m,mm,swift}', 'Source/ui/**/*.{h,m,mm,swift}', 'Source/TUIVoiceRoomKit_TRTC/*.{h,m,mm,swift}'
   trtc.ios.framework = ['AVFoundation', 'Accelerate']
   trtc.library = 'c++', 'resolv'
   trtc.resource_bundles = {
     'TUIVoiceRoomKitBundle' => ['Resources/*.xcassets', 'Resources/localized/**/*.strings' ]
   }
 end

 spec.subspec 'TRTC_Preview' do |trtc|
   trtc.pod_target_xcconfig = { 'HEADER_SEARCH_PATHS' => '${PODS_TARGET_SRCROOT}/../../SDK/TXLiteAVSDK_TRTC.framework/Headers/'}
   trtc.dependency 'TXLiteAVSDK_TRTC_Preview'
   trtc.source_files = 'Source/Localized/**/*.{h,m,mm,swift}', 'Source/model/**/*.{h,m,mm,swift}', 'Source/ui/**/*.{h,m,mm,swift}', 'Source/TUIVoiceRoomKit_TRTC/*.{h,m,mm,swift}'
   trtc.ios.framework = ['AVFoundation', 'Accelerate']
   trtc.library = 'c++', 'resolv'
   trtc.resource_bundles = {
     'TUIVoiceRoomKitBundle' => ['Resources/*.xcassets', 'Resources/localized/**/*.strings' ]
   }
 end
 
 spec.subspec 'Enterprise' do |enterprise|
   enterprise.dependency 'TXLiteAVSDK_Enterprise'
   framework_path="../SDK/TXLiteAVSDK_Enterprise.framework"
   enterprise.pod_target_xcconfig={
       'HEADER_SEARCH_PATHS'=>["$(PODS_TARGET_SRCROOT)/../#{framework_path}/Headers"]
   }
   enterprise.source_files = 'Source/Localized/**/*.{h,m,mm,swift}', 'Source/model/**/*.{h,m,mm,swift}', 'Source/ui/**/*.{h,m,mm,swift}', 'Source/TUIVoiceRoomKit_Enterprise/*.{h,m,mm,swift}'
   enterprise.ios.framework = ['AVFoundation', 'Accelerate', 'AssetsLibrary']
   enterprise.library = 'c++', 'resolv', 'sqlite3'
   enterprise.resource_bundles = {
     'TUIVoiceRoomKitBundle' => ['Resources/*.xcassets', 'Resources/localized/**/*.strings' ]
   }
 end

 
end

