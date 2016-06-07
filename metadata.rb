maintainer       "Vasily Mikhaylichenko"
maintainer_email "vasily@locomote.com"
license          "Apache 2.0"
description      "RVM and Ruby system installation"
version          "0.3.3"

recipe "rvm",  "Installs RVM and Ruby in /usr/local/rvm"

%w{ redhat_pkgin redhat centos ubuntu }.each do |os|
  supports os
end
