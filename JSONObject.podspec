Pod::Spec.new do |s|
  s.name         = 'JSONObject'
  s.version      = '0.0'
  s.summary      = 'Lightweight JSON marshaling for Objective-C'
  s.author = {
    'Roderick Monje' => 'rod@foveacentral.com'
  }
  s.source = {
    :git => 'https://github.com/ivanoblomov/JSONObject.git',
    :tag => '0.0'
  }
  s.source_files = 'Source/*.{h,m}'
end