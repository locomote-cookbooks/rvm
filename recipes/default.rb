include_recipe "rvm::requirements"

rvm = "source /etc/profile.d/rvm.sh && rvm"

bash "Install rvm system-wide" do
  code "curl -L https://get.rvm.io | bash -s stable"
  not_if "test -d /usr/local/rvm"
end

cookbook_file "/etc/profile.d/rvm.sh" do
  source "rvm.sh"
  mode "0755"
end

bash "Install libyaml" do
  code "#{rvm} pkg install libyaml"
  not_if "test -f /usr/local/rvm/usr/include/yaml.h"
end

bash "Install default ruby" do
  code "#{rvm} install #{node['rvm']['default_ruby']}"
  not_if "#{rvm} list | grep #{node['rvm']['default_ruby']}"
end

bash "chgrp -R rvm /usr/local/rvm/" do
  code "chgrp -R rvm /usr/local/rvm/"
end

%w{bundler whenever}.each do |gem|
  rvm_gem gem do
    action :install
    options '--no-ri --no-rdoc'
  end
end

rvm_gem 'rake' do
  action :install
  options '--no-ri --no-rdoc --version 10.0.2'
end

%w{bundle rake whenever}.each do |bin|
  rvm_wrapper('rvm') { binary bin }
end

