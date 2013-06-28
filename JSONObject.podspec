Pod::Spec.new do |s|
  s.author = {
    'Roderick Monje' => 'rod@foveacentral.com'
  }
  s.homepage = 'https://github.com/ivanoblomov/JSONObject'
  s.license = 'MIT'
  s.name = 'JSONObject'
  s.summary = 'Lightweight JSON marshaling for Objective-C, with Ruby-like string inflections as a bonus.'
  s.source = {
    :git => 'https://github.com/ivanoblomov/JSONObject.git',
    :tag => '0.0.2'
  }
  s.source_files = 'Classes/*.{h,m}'
  s.version      = '0.0.2'
end