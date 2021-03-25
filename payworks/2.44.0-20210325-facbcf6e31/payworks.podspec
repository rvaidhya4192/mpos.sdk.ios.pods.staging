Pod::Spec.new do |spec|
    spec.name               = 'payworks'
    spec.version            = '2.44.0-20210325-facbcf6e31'
    spec.license            = { :type => 'Copyright', :text => '©2020 Payworks GmbH. All rights reserved.' }
    spec.homepage           = 'https://payworks.com/developers'
    spec.authors            = { 'payworks' => 'developers@payworks.com' }
    spec.summary            = 'A delightful payment integration framework powered by payworks'
    spec.platform           = :ios, '10.0'
    spec.requires_arc       = true
    spec.source             = { :http => 'https://releases.payworks.io/artifactory/mpos-ios-staging/io/payworks/mpos.ios.sdk/'+spec.version.to_s+'/mpos.ios.sdk-'+spec.version.to_s+'.zip' }
    spec.default_subspec       = 'default'
    
    spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
    }
    spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    
    spec.subspec 'mpos' do |mpos|

        mpos.subspec 'core' do |core|
            core.vendored_frameworks    = 'mpos_core.framework', 'core.framework'
            core.resource               = 'mpos_core_resources.bundle'
            core.frameworks             = 'ExternalAccessory', 'Security', 'MobileCoreServices', 'SystemConfiguration', 'UIKit', 'Foundation', 'CoreGraphics'
            core.library                = 'icucore'
            core.dependency               'CocoaLumberjack', '~> 3.7.0'
            core.dependency               'AFNetworking',    '~> 4.0'
        end

        mpos.subspec 'accessories' do |accessories|

            accessories.subspec 'miura' do |miura|
                miura.vendored_frameworks = 'mpos_accessories_miura_shuttle.framework'
                miura.dependency            'payworks/mpos/core'
            end

            accessories.subspec 'vipa' do |vipa|
                vipa.vendored_frameworks = 'mpos_accessories_vipa.framework'
                vipa.dependency            'payworks/mpos/core'
            end

        end
    end

    spec.subspec 'default' do |default|
        default.dependency 'payworks/mpos/core'
        default.dependency 'payworks/mpos/accessories/miura'
        default.dependency 'payworks/mpos/accessories/vipa'
    end

    spec.subspec 'offline' do |offline|
        offline.dependency 'couchbase-lite-ios', '~> 1.4.1'
        offline.dependency 'payworks/mpos'
    end
end
