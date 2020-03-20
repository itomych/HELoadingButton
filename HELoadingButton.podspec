Pod::Spec.new do |spec|
    spec.name         = "HELoadingButton"
    spec.version      = "0.2.0"
    spec.summary      = "UIButton subclass with an activity indicator"
    spec.homepage     = "https://github.com/itomych"
    spec.license      = 'MIT'
    spec.author       = { "itomych studio" => "office@itomy.ch" }
    spec.source       = { :git => "https://github.com/itomych/HELoadingButton.git", :tag => spec.version }
    spec.platform     = :ios
    spec.requires_arc = true
    spec.frameworks   = 'UIKit'

    spec.default_subspec = "Core"

    spec.subspec 'Core' do |subspec|
        subspec.source_files = 'HELoadingButton/**/*.{h,m}'
        subspec.public_header_files = 'HELoadingButton/**/*.h'
    end

    spec.subspec 'HEMaterialDesignLoadingButton' do |subspec|
        subspec.source_files = 'HEMaterialDesignLoadingButton/**/*.{h,m}'
        subspec.public_header_files = 'HEMaterialDesignLoadingButton/**/*.h'
        subspec.dependency 'HELoadingButton/Core'
        subspec.dependency 'MMMaterialDesignSpinner', '~> 0.2'
    end

    spec.ios.deployment_target = '5.1.1'
end
