# Development

This guide contains information for setting up this repository for development. It also includes a guide on how to develop these images.

## Requirements

There are few requirements for development, as most of the dependencies are automatically installed for you, via Vagrant.

- Vagrant.
- VMWare Fusion (and Vagrant-VMware provider plugin) or Virtualbox.
- Vagrant Host Manager plugin (execute `vagrant plugin install vagrant-hostmanager` to install).
- Git.

__Please note:__ this has only been tested on Mac OS X environments.

Follow these steps to setup the VM:

- [Host]    `cd` into the directory containing this Git repository.
- [Host]    Execute `vagrant up --provider=virtualbox` to have Vagrant create a virtual machine.

With the VM started, update it to the latest setup (including a kernel update which is important for Docker):

- [Host]    `vagrant ssh`.
- [Guest]   `sudo apt-get update` to update the Aptitude repositories.
- [Guest]   `sudo apt-get -y dist-upgrade` (you might have to answer a few prompts, don't install GRUB).
- [Guest]   With everything updated reload the VM, type `exit` or `CTRL + d`.
- [Host]    `vagrant reload`.

Once the VM has restarted, continue with the process:

- [Host]    Execute `vagrant ssh` to be provided with a bash shell within the virtual machine.
- [Guest]   Get into the `/vagrant` directory, by executing `cd /vagrant`.
- [Guest]   Execute `c build` to use Docker compose to build the containers.
- [Guest]   Start them with `c up && c logs`.

Now you have all the containers up and running. To test the images, execute `c up` (on the [Guest]). This is a custom script that has been built to ease the process of interacting with Docker and Docker Compose.

## Git, building and testing

The core images in this repository are:

- `idearium/consul`
- `idearium/consului`

There is also one used only for testing:

- `idearium/orchestrator-app`

### Building

You can build these images locally using `c up`, `c build` and `c rebuild`. These images are built for production using Docker Cloud. Autobuilt repositories have been setup and will automatically build for you on certain events:

- Pushing to `dev` branch will build the `:dev` version of these images.
- Pushing a tag in the format `{image-name}-v{semver}` will build the images, with the corresponding version tag.
- Pushing to master won't kick-off any build process.

### Git

`master` should contain only tested working code. A `dev` branch should be created and used for development purposes. If you need to, you can branch from `dev` as required for testing locally and trying out ideas. However, should you want to build those remotely, you'll need to use the `dev` branch.
