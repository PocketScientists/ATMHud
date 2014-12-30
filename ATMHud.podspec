Pod::Spec.new do |s|
  s.name          = 'ATMHud'
  s.version       = '1.0.0'
  s.source        = { :git => 'https://github.com/PocketScientists/ATMHud.git' }
  s.platform      = :ios
  s.source_files  = 'ATM*.{h,m}', '*.png'
  s.requires_arc  = false
end