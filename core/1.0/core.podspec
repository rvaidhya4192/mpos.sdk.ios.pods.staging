Pod::Spec.new do |spec|
    spec.name                     = 'core'
    spec.version                  = '1.0'
    spec.license            = { :type => 'Copyright', :text => '©2020 Payworks GmbH. All rights reserved.' }
    spec.homepage                 = 'https://developer.payworks.com'
    spec.authors            = { 'payworks' => 'developers@payworks.com' }
    spec.source             = { :git => 'https://pw-aleix-guri@bitbucket.org/payworks/io.payworks.mpos.sdk.git', :branch => 'feature/CPU-2515-use-core-cocoapods' }
    spec.summary                  = 'The mpos core kotlin multiplatform module.'
    spec.platform           = :ios, '10.0'
    spec.static_framework         = true
    spec.vendored_frameworks      = "Common/core/core.framework"
    spec.libraries                = "c++"
    spec.module_name              = "#{spec.name}_umbrella"

                

                

    spec.pod_target_xcconfig = {
        'KOTLIN_TARGET[sdk=iphonesimulator*]' => 'ios_x64',
        'KOTLIN_TARGET[sdk=iphoneos*]' => 'ios_arm',
        'KOTLIN_TARGET[sdk=watchsimulator*]' => 'watchos_x86',
        'KOTLIN_TARGET[sdk=watchos*]' => 'watchos_arm',
        'KOTLIN_TARGET[sdk=appletvsimulator*]' => 'tvos_x64',
        'KOTLIN_TARGET[sdk=appletvos*]' => 'tvos_arm64',
        'KOTLIN_TARGET[sdk=macosx*]' => 'macos_x64'
    }

#    spec.script_phases = [
#        {
#            :name => 'Build core',
#            :execution_position => :before_compile,
#            :shell_path => '/bin/sh',
#            :script => <<-SCRIPT
#                set -ev
#                REPO_ROOT="$PODS_TARGET_SRCROOT"
#                "$REPO_ROOT/../../gradlew" -p "$REPO_ROOT" :core:syncFramework \
#                    -Pkotlin.native.cocoapods.target=$KOTLIN_TARGET \
#                    -Pkotlin.native.cocoapods.configuration=$CONFIGURATION \
#                    -Pkotlin.native.cocoapods.cflags="$OTHER_CFLAGS" \
#                    -Pkotlin.native.cocoapods.paths.headers="$HEADER_SEARCH_PATHS" \
#                    -Pkotlin.native.cocoapods.paths.frameworks="$FRAMEWORK_SEARCH_PATHS"
#            SCRIPT
#        }
#    ]
end
