define :rvm_gem do
  ruby_string = params[:ruby_string] || 'default'
  rvm_env = "source /etc/profile && rvm use #{ruby_string} &&"

  case params[:action]
  when :install
    not_if_cmd  = "#{rvm_env} gem which #{params[:name]}"
    install_cmd = "#{rvm_env} gem install #{params[:name]} #{params[:options]}"

    bash "gem install #{params[:name]}" do
      code "(#{not_if_cmd}) || (#{install_cmd})"
    end
  when :uninstall
    bash "gem uninstall #{params[:name]}" do
      code "#{rvm_env} gem uninstall #{params[:name]} #{params[:options]}"
    end
  end
end
