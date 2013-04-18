if platform? 'ubuntu'
  %w(
    openssl
    libreadline6
    libreadline6-dev
    zlib1g
    zlib1g-dev
    libssl-dev
    libyaml-dev
    libsqlite3-dev
    sqlite3
    libxml2-dev
    libxslt-dev
    libc6-dev
    ncurses-dev
    automake
    libtool
    bison
    subversion
  ).each do |pkg|
    package pkg do
      action :install
    end
  end
elsif platform_family? 'rhel'
  %w(
    patch
    readline
    readline-devel
    zlib
    zlib-devel
    libyaml-devel
    libffi-devel
    openssl-devel
    bzip2
    automake
    libtool
    libxml2
    libxml2-devel
    libxslt
    libxslt-devel
    sqlite-devel
    bison
    bison-devel
  ).each do |pkg|
    yum_package pkg do
      action :install
    end
  end
end
