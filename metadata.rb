name 'mongoctl'
license 'MIT'
description 'Installs mongoctl and mongodb'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

%w( python user ).each do |req|
  depends req
end

%w( ubuntu ).each do |os|
  supports os
end
