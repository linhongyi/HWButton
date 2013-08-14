Pod::Spec.new do |s|
  s.name     = 'HWButton'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.platform = 'ios'
  s.summary  = 'Base View Component.'
  s.homepage = 'https://github.com/linhongyi/HWButton'
  s.author   = {'HongYiLin' => 'm9615061@mail.ntust.edu.tw'}
  s.source   = { :git => 'https://github.com/linhongyi/HWButon.git', :tag => "1.0.0"}
  s.source_files = '*.{h,m}'
  s.license      = { :type => 'MIT', :text => <<-LICENSE
					Copyright 2012
					Permission is granted to...
					LICENSE
				 }
end
