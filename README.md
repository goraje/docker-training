# Docker Training

## Requirements

- basic knowledge of Linux

## Technical Requirements

- working Linux installation; either on your own Linux host or by means of the VM provided in this projec through Vagrant
- working Docker installation (version >= 18.03; the Vagrant image comes with Docker pre-installed)

## Docker installation on your host machine

Avoid installing Docker from your distribution's official repositories as in most cases they are not up-to-date. Instead install Docker following the instructions that are found in the official documentation, which can be found [here](https://docs.docker.com/install/).

## Installing the VM with Vagrant

### Requirements

- Vagrant
- VirtualBox (please keep in mind to keep your VirtualBox instllation up-to-date)

### Vagrant and VirtualBox installation instructions

The installation instructions for Vagrant and VirtualBox on different platforms can be found [here](https://github.com/goraje/ansibletraining/blob/master/INSTALL.md).

### VM installation instructions

The Vagrantfile depends on 3 Vagrant plugins:

- vagrant-proxyconf
- vagrant-reload
- vagrant-disksize

Install the plugins prior to running Vagrant:

```
vagrant plugin install <plugin-name>
```

You can get the list of currently installed Vagrant plugins by typing:

```
vagrant plugin list
```

Before installing the VM edit the provided Vagrantfile and and proxy settings, if necessary by modifying the following variables:

```
$http_proxy = "<your-proxy-here>"
$https_proxy" = <your-proxy-here>"
```

When you are done you can run the VM provisioning by typing:

```
vagrant up --provision
```

When the process is finished stop the running VM with

```
vagrant halt
```

You can then open the VM through VirtualBox's GUI.
