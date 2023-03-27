Pod::Spec.new do |spec|
    spec.name               = 'payworks'
    spec.version            = '2.60.0-20230327-7d7a9d7694'
    spec.license            = { :type => 'Copyright', :text => 'Copyright (c) 2023 VISA Inc. All Rights Reserved.' }
    spec.homepage           = 'https://payworks.com/developers'
    spec.authors            = { 'payworks' => 'developers@payworks.com' }
    spec.summary            = 'A delightful payment integration framework powered by payworks'
    spec.platform           = :ios, '15.0'
    spec.requires_arc       = true
    spec.source             = { :http => 'https://artifactory.trusted.visa.com/mpos-staging/io/payworks/mpos.ios.sdk/'+spec.version.to_s+'/mpos.ios.sdk-'+spec.version.to_s+'.zip' }
    spec.default_subspec       = 'default'

    spec.subspec 'mpos' do |mpos|

        mpos.subspec 'core' do |core|
            core.vendored_frameworks    = 'mpos_core.xcframework', 'core.xcframework'
            core.frameworks             = 'ExternalAccessory', 'Security', 'MobileCoreServices', 'SystemConfiguration', 'UIKit', 'Foundation', 'CoreGraphics'
            core.library                = 'icucore'
        end
    end

    spec.subspec 'default' do |default|
        default.dependency 'payworks/mpos/core'
    end

    spec.subspec 'offline' do |offline|
        offline.dependency 'payworks/mpos'
    end
end
