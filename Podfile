# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
source 'https://github.com/CocoaPods/Specs.git'

def network
  pod 'Alamofire', '~> 4.7'
  pod 'AlamofireObjectMapper', '~> 5.2.0'
  pod 'RxAlamofire', '~> 4.3.0'
end

def jsonParser
  pod 'ObjectMapper', '~> 3.4.1'
  pod 'SwiftyJSON', '~> 4.0'
end

def rx
  pod 'RxSwift', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'
  pod 'RxAtomic'
end

def inject
#  pod 'Swinject', '~> 2.5.0'
#  pod 'SwinjectStoryboard', '~> 2.1.0'
  pod 'netfox'
  
end

def view
  pod 'SwiftMessages', '~> 6.0.0'
  pod 'DLRadioButton', '~> 1.4.12'
  pod 'SBPickerSelector', '~> 1.2.0'
  pod 'SkyFloatingLabelTextField', '~> 3.0'
  pod 'IQKeyboardManagerSwift', '~> 6.2.0'
  pod 'EasyTipView', '~> 2.0.0'
  pod 'MultilineTextField'
  pod 'FittedSheets'
  pod 'SwiftRichString'
  pod 'Cosmos', '~> 18.0'
  
end


def allPods
  network
  jsonParser
  rx
  inject
  view
end

target 'Mandiri' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  allPods
  
  # Pods for Mandiri

  target 'MandiriTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
