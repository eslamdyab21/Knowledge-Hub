Introduction

A [type 2 hypervisor](https://phoenixnap.com/kb/what-is-hypervisor-type-1-2#htoc-type-2-hypervisor) enables users to run isolated instances of other operating systems inside a host system. As a Linux based OS, Ubuntu supports a wide range of virtualization solutions.


</br>
</br>

## Check Virtualization Support on Ubuntu 20.04
1. Before you begin with installing KVM, check if your CPU supports hardware virtualization via [egrep command](https://phoenixnap.com/kb/linux-egrep):

```bash
egrep -c '(vmx|svm)' /proc/cpuinfo
```

Check the number in the output:
![Checking virtualization support using egrep command](https://phoenixnap.com/kb/wp-content/uploads/2021/04/output-from-egrep-c-vmx-svm-proc-cpuinfo.png)

  
If the command returns a value of **`0`**, your processor is not capable of running KVM. On the other hand, any other number means you can proceed with the installation.

2. Now, check if your system can use KVM acceleration by typing:

```bash
sudo kvm-ok
```

The output should look like this:

![Checking if the system is set up to run kvm virtualization](https://phoenixnap.com/kb/wp-content/uploads/2021/04/output-from-kvm-ok.png)


You are now ready to start installing KVM.

---

</br>

## Install KVM on Ubuntu 20.04

To enable KVM virtualization on Ubuntu 20.04:
-   Install related packages [using apt](https://phoenixnap.com/kb/how-to-manage-packages-ubuntu-debian-apt-get)
-   Authorize users to run VMs
-   Verify that the installation was successful

</br>

### Step 1: Install KVM Packages
1. First, update the repositories:
```bash
sudo apt update
```

2. Then, install essential KVM packages with the following command:

```bash
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
```

This will start the installation of four KVM packages:

![Installing the packages necessary to run KVM in Ubuntu 20.04](https://phoenixnap.com/kb/wp-content/uploads/2021/04/output-from-sudo-apt-install-qemu-kvm-libvirt-daemon-system-libvirt-clients-bridge-utils.png)

  
3. When prompted, type **`Y`**, press **ENTER**, and wait for the installation to finish.

</br>
</br>

### Step 2: Authorize Users
1. Only members of the **libvirt** and **kvm** user groups can run [virtual machines](https://phoenixnap.com/glossary/what-is-a-virtual-machine). Add a user to the libvirt group by typing:

```bash
sudo adduser ‘username’ libvirt
```

Replace _username_ with the actual username.

![Adding a user to the libvirt usergroup](https://phoenixnap.com/kb/wp-content/uploads/2021/04/output-from-sudo-adduser-username-libvirt.png)

2. Now do the same for the kvm group:

```bash
sudo adduser ‘[username]’ kvm
```

![Adding user to the kvm usergroup](https://phoenixnap.com/kb/wp-content/uploads/2021/04/output-from-sudo-adduser-username-kvm.png)

---

**Note:** If you need to remove a user from the libvirt or kvm group, just replace **`adduser`** with **`deluser`** in the command above.

---

</br>
</br>

### Step 3: Verify the Installation

1. Confirm the installation was successful by using the **`virsh`** command:

```bash
virsh list --all
```

You can expect an output as seen below:

![Confirming the installation was successful using virsh command](https://phoenixnap.com/kb/wp-content/uploads/2021/04/output-from-virsh-list-all.png)

2. Or use the **`systemctl`** command to check the status of libvirtd:

```bash
sudo systemctl status libvirtd
```

If everything is functioning properly, the output returns an **`active (running)`** status.

![Checking the status of the virtualization daemon with systemctl](https://phoenixnap.com/kb/wp-content/uploads/2021/04/output-from-systemctl-status-libvirtd.png)

3. Press **`Q`** to quit the status screen.

4. If the virtualization daemon is not active, activate it with the following command:
```bash
sudo systemctl enable --now libvirtd
```

</br>
</br>

## Creating a Virtual Machine on Ubuntu 20.04

1. Before you choose one of the two methods listed below, install virt-manager, a tool for creating and managing VMs:

```bash
sudo apt install virt-manager
```

![Installing virt-manager with apt](https://phoenixnap.com/kb/wp-content/uploads/2021/04/output-from-sudo-apt-install-virt-manager.png)

2. Type **`Y`** and press **ENTER**. Wait for the installation to finish.

Make sure you download an ISO containing the OS you wish to install on a VM and proceed to pick an installation method.

### Method 1: Virt Manager GUI

1. Start virt-manager with:

```bash
sudo virt-manager
```

https://phoenixnap.com/kb/ubuntu-install-kvm
