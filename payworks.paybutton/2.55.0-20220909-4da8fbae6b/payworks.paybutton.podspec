Pod::Spec.new do |spec|
	spec.name				= 'payworks.paybutton'
	spec.version			= '2.55.0-20220909-4da8fbae6b'
	spec.license			= { :type => 'Copyright', :text => 'Copyright (c) 2021 CyberSource Corporation. All Rights Reserved.' }
	spec.homepage			= 'https://www.payworks.com/developers'
    spec.authors            = { 'payworks' => 'developers@payworks.com' }
	spec.summary			= 'A delightful UI framework build on top of the venerated payment integration framework powered by payworks'
	spec.platform			= :ios, '10.0'
	spec.requires_arc		= true
	spec.swift_version      = '5.0'
	spec.source				= { :http => 'https://releases.payworks.io/artifactory/mpos-ios-staging/io/payworks/mpos.ios.ui/'+spec.version.to_s+'/mpos.ios.ui-'+spec.version.to_s+'.zip' }
	spec.vendored_frameworks = 'mpos_ui.xcframework'

	spec.ios.dependency			'payworks/mpos/core', '2.55.0-20220909-4da8fbae6b'
end
