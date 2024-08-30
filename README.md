# universal-setup

Ansible playbook to setup my Mac and soon Ubuntu machines

## Setup

### Manual Setup

1. Install [brew](https://brew.sh/)
2. `brew install python3 ansible git`
3. Clone this repo
4. `ansible-galaxy collection install community.general`
5. If not a work laptop set environment variable to `export OJ39_ANSIBLE_INSTALL_NSFW=true` (default is false)
6. `ansible-playbook base_installation.yml -K`

### One-line setup

Coming soon…

## What will be installed?

-

## Test

Test for all platforms are done in the pipelines, but you can test locally with act:
`act --matrix nsfw:true --matrix os:ubuntu-latest`

## TODOs

- [ ] Add one-line install for brew, ansible and run this (darwin and ubuntu)
  - [ ] Remove brew install from playbook
- [ ] Add this for dock setup: <https://github.com/geerlingguy/mac-dev-playbook/blob/master/default.config.yml#L6-L16>
- [ ] add to readme how to include this in a another (e.g. work laptop setup playbook)
