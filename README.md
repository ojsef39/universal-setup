# universal-setup

Ansible playbook to setup my Mac and soon Ubuntu machines

## Setup

1. Install [brew](https://brew.sh/)
2. `brew install python3 ansible`
3. `ansible-playbook base_installation.yml`

## What will be installed?

-

## Test

Test for all platforms are done in the pipelines, but you can test locally with act:
`act --matrix os:ubuntu-latest`

## TODOs

- [ ] Add one-line install for brew, ansible and run this (darwin and ubuntu)
  - [ ] Remove brew install from playbook
