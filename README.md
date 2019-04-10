ansible-role-provider
=========

[![Build Status](https://travis-ci.org/cjsteel/ansible-role-providers.svg?branch=master)](https://travis-ci.org/cjsteel/ansible-role-providers)[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-resources-blue.svg)](https://galaxy.ansible.com/cjsteel/providers/)

## Description

An Ansible role for updating the molecule scenario files of other roles,

Scenario:

* You are using molecule for testing multiple ansible roles and/or ansible projects. 
* You want to update one or more roles or projects molecule files or add new provider support via automation.

## Usage notes

* Generally run from another role.
* The calling role requires a bootstrap molecule/some_scenario/playbook.yml  file.
* To replace one or more scenario files set the variable for the target file or file group of files to be true.
* Updating ` molecule/some_scenario/playbook.yml` currently sets all update values (back) to false.

Bootstrap playbook example:

* [molecule/lxd/playbook.yml](molecule/lxd/playbook.yml)

Note: you will need to change the following two variables to the calling roles values

    providers_short_name: providers
    providers_galaxy_name: cjsteel.providers

This could probably / should be automated.

## Roadmap

* [ROADMAP.md](./ROADMAP.md)

## Role Variables

* [defaults/main.yml](defaults/main.yml)

### providers_role_short_name

```shell
providers_role_short_name: 'testrole'
```

### providers_project_directory

```shell
providers_project_directory: /home/csteel/projects/development/cobbler/roles/csteel.common
```

## License

MIT

Author Information

An optional section for the role authors to include contact information, or a
website (HTML is not allowed).
