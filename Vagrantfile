def plugin(name, version = nil, opts = {})
  @vagrant_home ||= opts[:home_path] || ENV['VAGRANT_HOME'] || "#{ENV['HOME']}/.vagrant.d"
  plugins = JSON.parse(File.read("#@vagrant_home/plugins.json"))

  if !plugins['installed'].include?(name) || (version && !version_matches(name, version))
    cmd = "vagrant plugin install"
    cmd << " --entry-point #{opts[:entry_point]}" if opts[:entry_point]
    cmd << " --plugin-source #{opts[:source]}" if opts[:source]
    cmd << " --plugin-version #{version}" if version
    cmd << " #{name}"

    result = %x(#{cmd})
  end
end

def version_matches(name, version)
  gems = Dir["#@vagrant_home/gems/specifications/*"].map { |spec| spec.split('/').last.sub(/\.gemspec$/,'').split(/-(?=[\d]+\.?){1,}/) }
  gem_hash = {}
  gems.each { |gem, v| gem_hash[gem] = v }
  gem_hash[name] == version
end

# With version/source: plugin 'vagrant-berkshelf', '1.3.2', source: 'https://rubygems.org'
plugin 'vagrant-cachier'
plugin 'vagrant-omnibus'


Vagrant.configure("2") do |config|
  config.vm.box = 'shared-cache'
  config.cache.auto_detect = true
#  config.cache.enable_nfs  = true
end

Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.forward_port 8080, 4000

  config.vm.provision :chef_solo do |chef|
  #configuring soft that's going to be installed
    chef.json.merge!({
      :java => {
        "install_flavor" => "oracle",
        :oracle => {"accept_oracle_download_terms" => true},
        :jdk_version => "7"
       },
      :mysql=> {
        :client => { :version => "5.5.28" },
        :server_root_password => "root",
        :server_repl_password => "no_replication",
        :server_debian_password => "root"
      },
      :resolver => {
        :nameservers => ["8.8.8.8", "8.8.4.4"]
      }

    })
    #updating package caches to install fresh soft
    chef.add_recipe("resolver")
    chef.add_recipe("apt-get")
    #installing software
    chef.add_recipe("java")
    chef.add_recipe("openssl::default")
    chef.add_recipe("mysql::server") #installs both client and server
    chef.add_recipe("tomcat7")
    chef.add_recipe("python::pip")
    chef.add_recipe("apt")
    chef.add_recipe("git")
    chef.add_recipe("jtalks::cicd")
  end
end
