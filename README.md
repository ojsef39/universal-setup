# universal-setup

Ansible playbook to setup my Mac and soon Ubuntu machines

## Setup

### Manual Setup

1. Install [brew](https://brew.sh/)
2. `brew install python3 ansible git`
3. Clone this repo
4. If not a work laptop set environment variable `export OJ39_ANSIBLE_NOT_WORK=true` (default is false)
5. `ansible-playbook base_installation.yml -K`

### One-line setup

Coming soon…

## What will be installed?

1. If not a work laptop set environment variable to `export OJ39_ANSIBLE_NOT_WORK=true` (default is false)
2. `curl https://raw.githubusercontent.com/ojsef39/universal-setup/main/setup.sh | bash`

## Test

Test for all platforms are done in the pipelines, but you can test locally with act:
`act --matrix nfw:true --matrix os:ubuntu-latest`

## TODOs

- [x] Add one-line install for brew, ansible and run this (darwin and ubuntu)
  - [x] Remove brew install from playbook
- [ ] Add this for dock setup: <https://github.com/geerlingguy/mac-dev-playbook/blob/master/default.config.yml#L6-L16>
- [ ] add to readme how to include this in a another (e.g. work laptop setup playbook)
- [ ] Sync script
  - [ ] .config stuff
  - [ ] plists (only iterm atm)