# kvm_nvidia_pci_passthrough
Start and stop scripts to passthrough a pci nvidia graphic card to a vm

# install
Put start scripts in /etc/libvirt/hooks/qemu.d/{vm_name}/
qemu file is called in /etc/libvirt/hooks when vm starts or stops.
