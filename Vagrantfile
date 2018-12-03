Vagrant.configure(2) do |config|
  #config.vm.box = "centos/7"
  #config.vm.box = "centos/6"

  #config.vm.box_download_insecure = true

  config.vm.define :baas_server do |baas_server|
    baas_server.vm.box = "centos/7"
    baas_server.vm.network :private_network, ip: "192.168.33.10"
    baas_server.vm.network :forwarded_port, guest: 22, host: 32230, id: "ssh"
    baas_server.vm.network :forwarded_port, guest: 8080, host: 18080
    baas_server.ssh.insert_key = false
  end
end
