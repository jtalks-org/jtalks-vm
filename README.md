JTalks Virtual Environment
==

If you want to start a brand new environment for JTalks with installed software using just a couple of commands - then this is what you're looking for. This project helps you to start a virtual environment using Vagrant + Chef scripts.

In order to start one of JTalks component, you need to go through several steps.
####Install Software
* Install [VirtualBox](https://www.virtualbox.org/) which is an Oracle driven tool for starting virtual environments. Vagrant started to support VMWare, but we didn't test our scripts with it.
* Install [Vagrant](http://www.vagrantup.com). It's an extremely simple tool that can start virtual environment and install software there using Chef or Puppet scripts.
* Download this project either in zip format or grab sources using Git. Unpack if needed and step into the folder.

####Start virtual environment
* `vagrant up` - this starts your env and runs Chef scripts. This may take a lot of time especially first time because it downloads software and virtual image from the internet.
* `vagrant ssh` - log into the just created virtual machine. For _Windows_ users you'll have to use [Putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) to log in via SSH. Use `Host: localhost`, `Port: 2222`. User: `vagrant`, password: `vagrant`.

####Start JCommune or Poulpe
* `jtalks deploy --environment vagrant --project jcommune --build 680` - this is just an example that start 660th build of [JCommune project](https://github.com/jtalks-org/jcommune).
 * Instead of `jcommmune` you can specify `poulpe` to start [Poulpe](https://github.com/jtalks-org/poulpe).
 * Instead of `660` you need to put a build you'd like to use, a list of them can be found in our [Deployment Pipeline Repository](http://repo.jtalks.org/content/repositories/deployment-pipeline/deployment-pipeline/). Every build has a suffix following major and minor version of the build.
* Now if everything is green (if not, read below), go to your browser and run http://localhost:4000/jcommune or http://localhost:4000/poulpe and here we are.
* The configuration is kept in `~/.jtalks` and can be changed if needed. For more information on how to install and use jtalks scripts see [JTalks CICD project](https://github.com/jtalks-org/jtalks-cicd)

####Shutdown environment
* Log out from virtual box, you still should be in `jtalks-vm` folder.
* You can either destroy everything wiping off databases by using `vagrant destroy`. After that you'll be able to start a brand new env again by running `vagrant up`
* Or you can simply shut down environment `vagrant suspend` and to continue work with it: `vagrant resume`
---

The very same cookbooks could be used on usual servers that don't leverage virtualization. E.g. we use them in order to install software, see folder `roles`. In order to install everything onto the machine, feel free to leverage [install-chef](utils/install-chef.sh) script. After installation you can go to `/var/chef/jtalks-vm` and install software using server roles, e.g.: `sudo chef-solo -j roles/jtalks-servers.json`

If you have problems, please contact us: project\[at\]jtalks\[.\]org
