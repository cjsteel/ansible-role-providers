ansible-role-provider
=========

Experiment in templating molecule provider files

Notes
---

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should
be mentioned here. For instance, if the role uses the EC2 module, it may be a
good idea to mention in this section that the boto package is required.

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
