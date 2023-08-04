Pod::Spec.new do |spec|
	spec.name				= 'payworks.paybutton'
	spec.version			= '2.61.0-20230802-e51d3f52c2'
	spec.license			= { :type => 'Copyright', :text => 'Copyright (c) 2023 VISA Inc. All Rights Reserved.' }
    spec.homepage           = 'https://payworks.mpymnt.com/cp_payworks_portal.html'
    spec.authors            = { 'payworks' => 'developers@payworks.com' }
	spec.summary			= 'A delightful UI framework build on top of the venerated payment integration framework powered by payworks'
	spec.platform			= :ios, '15.0'
	spec.requires_arc		= true
	spec.swift_version      = '5.0'
	spec.source				= { :http => 'https://artifactory.trusted.visa.com/mpos-staging/io/payworks/mpos.ios.ui/'+spec.version.to_s+'/mpos.ios.ui-'+spec.version.to_s+'.zip' }
	spec.vendored_frameworks = 'mpos_ui.xcframework'

	spec.ios.dependency			'payworks/mpos/core', '2.61.0-20230802-e51d3f52c2'
end