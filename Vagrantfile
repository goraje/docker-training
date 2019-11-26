Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.enabled = false
  end

  config.vm.box = "goraje/centos7-xfce"
  config.vm.hostname = "centos"
  config.vm.synced_folder ".", "/vagrant", disabled: false
  
  config.vm.provider "virtualbox" do |v|
    v.name = "dockertraining"
    v.cpus = 2
    v.memory = 2048
    v.gui = true
    v.customize ["modifyvm", :id, "--vram", "128"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

end
