#:-*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"
 # config.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  # Boot with a GUI so you can see the screen. (Default is headless)
 # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  # config.vm.network :hostonly, "192.168.33.10"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  # config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # You can now switch the browser and type [guest port] in your main OS
  # and it will be forwarded to the [host port] of OS in current VV
  config.vm.forward_port 8080, 4567

  config.vm.provision :chef_solo do |chef|
  #configuring soft that's going to be installed
    chef.json.merge!({
      :java => {
        "install_flavor" => "oracle",
        :oracle => {"accept_oracle_download_terms" => true}
       },
      :mysql=> {
        :client => { :version => "5.5.28" },
        :server_root_password => "root",
        :server_repl_password => "no_replication",
        :server_debian_password => "root"
      }
    })
    #updating package caches to install fresh soft
    chef.add_recipe("apt-get")
    #installing software
    chef.add_recipe("java") #OpenJDK is default
    chef.add_recipe("openssl::default")
    chef.add_recipe("mysql::server") #installs both client and server
    chef.add_recipe("tomcat7")
  end
end
