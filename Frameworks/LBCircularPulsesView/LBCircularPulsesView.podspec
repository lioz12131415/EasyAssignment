Pod::Spec.new do |spec|

  spec.name          = "LBCircularPulsesView"
  spec.version       = "0.0.1"
  spec.summary       = "LBCircularPulsesView framework summary"
  spec.description   = "LBCircularPulsesView framework description"
  spec.homepage      = "https://github.com/lioz12131415"
  spec.license       = "MIT"
  spec.author        = { "Lioz" => "lioz12131415@gmail.com" }
  spec.platform      = :ios, "14.0"
  spec.source        = { :git => "", :tag => "1.0.0" }
  spec.swift_version = '5.0'
  
  spec.requires_arc = true
  spec.libraries    = 'z'
         
  spec.resource_bundles = {
    'CircularPulsesView' => ['LBCircularPulsesView/**/*.{xcassets,xcdatamodeld,ttf}']
  }
  
  spec.pod_target_xcconfig = {
    'LD_RUNPATH_SEARCH_PATHS' => '$(FRAMEWORK_SEARCH_PATHS)'
  }
  
  spec.resources     = 'LBCircularPulsesView/**/*.{h,m,folder,xcassets,mp4,ttf}'
  spec.source_files  = "LBCircularPulsesView", "LBCircularPulsesView/**/*.{h,m,swift,folder,storyboard,strings,xcdatamodeld,xib,ttf}"
 
end
