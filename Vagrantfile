Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.hostname = "smashing"
  config.vm.provider "vmware_desktop" do |vmware|
    vmware.vmx["memsize"] = "1024"
    vmware.vmx["numvcpus"] = "2"
    vmware.gui = false
  end
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus = 2
    vb.gui = false
  end
  config.vm.network :forwarded_port, guest: 3030, host: 3030, auto_correct: true
  config.vm.provision :shell, :path => "scripts/smashingSetup.sh"
  config.ssh.forward_agent = true
end