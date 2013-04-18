define :rvm_wrapper do
  ruby_string = params[:ruby_string] || 'default'
  rvm_env = "source /etc/profile && rvm use #{ruby_string} &&"

  bash "create rvm wrapper" do
    code "#{rvm_env} rvm wrapper #{ruby_string} #{params[:name]} #{params[:binary]}"
  end
end
