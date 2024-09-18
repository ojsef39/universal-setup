# universal-setup

Ansible playbook to setup my Mac and soon Ubuntu machines

## Setup

### Manual Setup

1. Install [brew](https://brew.sh/)
2. `brew install python3 ansible git`
3. Clone this repo
4. If not a work laptop set environment variable `export OJ39_ANSIBLE_MODE=personal` (default is work)
5. `ansible-playbook base_installation.yml -K`

### One-line setup

1. If not a work laptop set environment variable to export `OJ39_ANSIBLE_MODE=personal` (default is work)
2. `curl setup.jhofer.de | bash` or `curl https://raw.githubusercontent.com/ojsef39/universal-setup/main/setup.sh | bash`

## What will be installed?

Coming soon…

## Test

Test for all platforms are done in the pipelines, but you can test locally with act:
`act --matrix mode:personal --matrix os:ubuntu-latest`

## TODOs

- [x] Add one-line install for brew, ansible and run this (darwin and ubuntu)
  - [x] Remove brew install from playbook
- [ ] Add this for dock setup: <https://github.com/geerlingguy/mac-dev-playbook/blob/master/default.config.yml#L6-L16>
- [ ] add to readme how to include this in a another (e.g. work laptop setup playbook)
- [ ] Sync script to keep the files here up to date
  - [ ] .config stuff
  - [ ] plists (only iterm atm)
  - [ ] maybe just have home directory as git repo ([inspiration](https://www.instagram.com/reel/C_tMXL4y-Kz/?igsh=OXZ2Z3R6ZXBidDhj)) and pull that/ open pr when changes are detected. (how split mac/linux then?)
- [ ] Add Magic Switch(.app)
- [ ] make the tmp folders vars (e.g. universal_tmp = /tmp/oj39/universal-setup/)
- [ ] Add aichat (brew) and commit-oracle (<https://github.com/tfriedel/commit-oracle?tab=readme-ov-file>)
