Vagrant.configure(2) do |config|
  #config.vm.box = "centos/7"
  #config.vm.box = "centos/6"

  config.vm.box_download_insecure = true
  config.vm.define :necbaas_servers do |necbaas_servers|
    necbaas_servers.vm.box = "centos/7"
    #necbaas_servers.vm.box_url = "http://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-1811_02.VirtualBox.box"
    necbaas_servers.vm.network :private_network, ip: "192.168.33.10"
    necbaas_servers.vm.network :forwarded_port, guest: 22, host: 32230, id: "ssh"
    necbaas_servers.vm.network :forwarded_port, guest: 8080, host: 18080
    necbaas_servers.vm.synced_folder ".", "/vagrant", disabled: true
    necbaas_servers.ssh.insert_key = false
  end
end
