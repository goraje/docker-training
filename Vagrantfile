# PROVIDE THE VALUES FOR HTTP AND HTTPS PROXY IF APPLICABLE
$http_proxy = ""
$https_proxy = ""

# LIST OF REQUIRED PLUGINS
required_plugins = [
  "vagrant-reload",
  "vagrant-proxyconf",
  "vagrant-disksize"
]

# REQUIREMENTS CHECK
unless required_plugins.all? { |plugin|  Vagrant.has_plugin?(plugin)}
  msg_head = <<-END

    WARNING:
    ===============================================================
    This project depends on the following Vagrant plugins:
  END
  msg_foot = <<-END
    Install the plugins using: vagrant-plugin install <plugin-name>
    ===============================================================

  END
  puts(msg_head)
  required_plugins.each {|plugin| puts("    - " +plugin)}
  puts(msg_foot)

  raise RuntimeError, "Required Vagrant plugins are missing"
end

# VAGRANT CORE SECTION
Vagrant.configure("2") do |config|

  if !($http_proxy.empty? || $https_proxy.empty?)
    config.proxy.http = "#{$http_proxy}"
    config.proxy.https = "#{$https_proxy}"
    config.proxy.no_proxy = "127.0.0.1,localhost,::1"
  end

  # VM DEFINITION SECTION
  config.vm.box = "archlinux/archlinux"
  config.vm.hostname = "archlinux"
  config.vm.synced_folder ".", "/vagrant", disabled: false
  
  config.vm.provider "virtualbox" do |v|
    v.name = "archlinux-dockertraining"
    v.cpus = 2
    v.memory = 4096
    v.gui = false
    v.customize ["modifyvm", :id, "--vram", "128"]
  end

  # PERFORM GLOBAL SYSTEM UPDATE, RANK MIRRORLISTS AND INSTALL DEVELOPMENT PACKAGES
  config.vm.provision :shell,
    env: $http_proxy.empty? || $https_proxy.empty? ? {} : {"http_proxy" => $http_proxy, "https_proxy" => $https_proxy},
    path: "./provisioning/shell/initial-provisioning.sh"
  
  # REBOOT THE VM
  config.vm.provision :reload

  # PROVISION THE VM USING ANSIBLE
  config.vm.provision :ansible_local do |ansible|
    ansible.playbook = "./provisioning/ansible/main.yml"
    ansible.inventory_path = "./provisioning/ansible/inventory"
    ansible.limit = "all"
    ansible.install = false
    ansible.verbose = true
  end

  # REBOOT THE VM
  config.vm.provision :reload

end
