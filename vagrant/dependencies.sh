#!/usr/bin/env bash

source /vagrant/vagrant/bashurator/init.sh

# Setup the environment.
configure_dependencies() {

    # Alias the docker-clean-containers script
    if [ ! -e /usr/local/bin/docker-clean-containers ]; then
        ln -s /vagrant/vagrant/scripts/docker-clean-containers.sh /usr/local/bin/docker-clean-containers
    fi

    # Alias the docker-clean-images script
    if [ ! -e /usr/local/bin/docker-clean-images ]; then
        ln -s /vagrant/vagrant/scripts/docker-clean-images.sh /usr/local/bin/docker-clean-images
    fi

    # Setup handy script for command dc commands
    if [ ! -e /usr/local/bin/c ]; then
        ln -s /vagrant/vagrant/scripts/c.sh /usr/local/bin/c
    fi

    # A handy script for tagging
    if [ ! -e /usr/local/bin/tag ]; then
        ln -s /vagrant/vagrant/scripts/tag.sh /usr/local/bin/tag
    fi

}

# Execute the function above, in an idempotent function.
bashurator.configure "dependencies" configure_dependencies
