default['rvm']['default_ruby'] = '1.9.3-p286'
default['rvm']['gemrc_path']   = case node['platform']
when 'redhat_pkgin'
  '/usr/pkg/etc/gemrc'
else
  '/etc/gemrc'
end
