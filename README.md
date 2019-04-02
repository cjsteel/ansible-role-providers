ansible-role-provider
=========

[![Build Status](https://travis-ci.org/cjsteel/ansible-role-providers.svg?branch=master)](https://travis-ci.org/cjsteel/ansible-role-providers)[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-resources-blue.svg)](https://galaxy.ansible.com/cjsteel/providers/)

Experiment in templating molecule provider files

Usage notes
---

* Generally run from another role.
* The calling role requires a bootstrap molecule/some_scenario/playbook.yml  file.
* To replace one or more scenario files set the variable for the target file or file group of files to be true.
* In the example below we update the example playbook,yml itself by setting `    providers_update_lxd_molecule_yml` to be true.
* Keep in mind that on the first run the original playbook.yml is run rather than the updated version.

Bootstrap playbook example:

```shell
---
# molecule/lxd/playbook.yml
#
# boilerplate used to update this roles molecule lxd scenario files.
#
#
- name: Converge updated provider files
  hosts: all
  vars:

    providers_short_name: model
    providers_galaxy_name: cjsteel.model

    providers_project_directory: "{{ lookup('env', 'PWD') }}"
    # files to be ubpdated should be set to be true
    # updating the lxd playbook file will overwrite this file
    providers_update_all_files: false         # !!update all scenario files!!
    providers_update_lxd_all_files: false     # !update all updatable lxd scenario files!
    providers_update_lxd_install_rst: false   # updates this molecule scenario file
    providers_update_lxd_molecule_yml: true   # updates this molecule scenario file
    providers_update_lxd_playbook_yml: false  # updates this molecule scenario file
    providers_update_lxd_playbook2_yml: false  # updates this molecule scenario file

  pre_tasks:
    - debug:
        var: providers_project_directory
  roles:
    - role: cjsteel.providers

- import_playbook: playbook2.yml
```



Roadmap
-------

* [ROADMAP.md](./ROADMAP.md)

Role Variables
--------------

* [defaults/main.yml](defaults/main.yml)

### providers_role_short_name

```shell
providers_role_short_name: 'testrole'
```

### providers_project_directory

```shell
providers_project_directory: /home/csteel/projects/development/cobbler/roles/csteel.common
```
Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in
regards to parameters that may need to be set for other roles, or variables that
are used from other roles.

Example Include
---------------

### Molecule update able lxd scenario 

`molecule/lxd/update_provider_files.yml`:

```shell
---
# update_providers.yml
#
# ATTENTION: USE WITH CAUTION. This playbook is used to update THIS ROLES molecule scenario files. Test  and should be used 
#
#
- name: Converge updated provider files
  hosts: all
  vars:

    providers_role_owner: 'cjsteel'
    providers_role_short_name: 'resources'
    providers_galaxy_name: '{{ providers_role_owner }}.{{ providers_role_short_name }}'
    providers_project_directory: "{{ lookup('env', 'PWD') }}"

    # Set value to true for file to be updated

    providers_update_docker_install_rst: false # Caution - updates scenario files
    providers_update_docker_molecule_yml: false # Caution - updates scenario files
    providers_update_docker_playbook_yml: false # Caution - updates scenario files

  roles:
    - role: cjsteel.providers

```

`molecule/lxd/update_provider_files.yml`:

here our calling role is asking to have all docker scenario files to be updated. 

```shell
---
- name: Converge
  hosts: all
  tasks:
   - set_fact:

      update_provider_files: true
      providers_update_docker_all_files: true

- name: "Update this roles provier files when update_provider_files is true"
  import_playbook: update_provider_files.yml update_pr
  when: update_provider_files

- name: Converge
  hosts: all
  roles:

    - role: cjsteel.resources

```

Triggering updates:

Updating this block in playbook.yml of any scenario triggers the requested updates and as a side effect ovewrites the file with the templated / default version in the providers role:

```shell
---
- name: Converge
  hosts: all
  tasks:
   - set_fact:

      update_provider_files: true
      providers_update_docker_all_files: true

- name: "Update this roles provier files when update_provider_files is true"
  import_playbook: update_provider_files.yml update_pr
  when: update_provider_files
  
```



```shell
---
# DANGER - HIGH VOLTAGE - boilerplate used for updating to update THIS ROLES molecule scenario files.
#
#
- name: Converge updated provider files
  hosts: all
  vars:

    providers_short_name: model
    providers_galaxy_name: cjsteel.model

    providers_project_directory: "{{ lookup('env', 'PWD') }}"
    # files to be ubpdated should be set to be true
    providers_update_lxd_install_rst: false   # caution - updates this roles molecule scenario files
    providers_update_lxd_molecule_yml: false  # caution - updates this roles molecule scenario files
    providers_update_lxd_playbook_yml: false  # caution - updates this roles molecule scenario files

  pre_tasks:
    - debug:
        var: providers_project_directory
  roles:
    - role: cjsteel.providers


```



```shell
- name: Run role cjsteel.providers to setup molecule providers for calling role
  include_role:
    name: cjsteel.providers
  vars:
    providers_role_short_name: 'cjsteel.cobbler'
    providers_project_directory: '/home/csteel/projects/development/cobbler/roles/csteel.common'
```
Example Playbook
----------------

Including an example of how to use your role (for instance, with variables
passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: cjsteel.providers, x: 42 }

License
-------

MIT

Author Information

An optional section for the role authors to include contact information, or a
website (HTML is not allowed).
