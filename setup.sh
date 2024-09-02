#!/bin/bash

# Function to install packages on macOS
install_on_mac() {
  # Check if Homebrew is installed
  if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed, installing..."
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Check if Git is installed
  if ! command -v git &>/dev/null; then
    echo "Git is not installed, installing..."
    # Install Git
    brew install git
  fi

  # Check if Ansible is installed
  if brew list ansible &>/dev/null; then
    echo "Ansible is installed, updating..."
    # Update Ansible
    brew upgrade ansible
  else
    echo "Ansible is not installed, installing..."
    # Install Ansible
    brew install ansible
  fi
}

# Function to install packages on Debian/Ubuntu
install_on_debian() {
  # Update package lists
  sudo apt-get update

  # Check if Git is installed
  if ! command -v git &>/dev/null; then
    echo "Git is not installed, installing..."
    # Install Git
    sudo apt-get install git -y
  fi

  # Check if Ansible is installed
  if dpkg -l ansible &>/dev/null; then
    echo "Ansible is installed, updating..."
    # Update Ansible
    sudo apt-get install ansible -y
  else
    echo "Ansible is not installed, installing..."
    # Install Ansible
    sudo apt-get install ansible -y
  fi
}

# Check the operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
  install_on_mac
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  install_on_debian
else
  echo "Unsupported operating system"
  exit 1
fi

# Get flags
branch="main"
no_pkg=false

while (("$#")); do
  case "$1" in
  --branch)
    branch=$2
    shift 2
    ;;
  --no-pkg)
    no_pkg=true
    shift
    ;;
  *)
    echo "Error: Invalid option"
    exit 1
    ;;
  esac
done

# Clone your repository into /tmp/oj39_/universal-setup
git clone --branch $branch https://github.com/ojsef39/universal-setup.git /tmp/oj39_/universal-setup

# Change directory to /tmp/oj39_/universal-setup
cd /tmp/oj39_/universal-setup

# For testing purposes, you can remove the package installation tasks
if [ "$no_pkg" = true ]; then
  rm /tmp/oj39_/universal-setup/tasks/debian/apt.yml
  rm /tmp/oj39_/universal-setup/tasks/darwin/homebrew.yml
fi

# Run your Ansible playbook
ansible-playbook base_installation.yml -K

# Change directory back to the previous location
cd -

# Remove the /tmp/oj39_ directory
rm -rf /tmp/oj39_
