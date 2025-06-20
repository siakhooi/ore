# ore
tools to automatically download,distribute,housekeep artifacts from various sources

## Installation
### Deb
```
sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.list | sudo tee /etc/apt/sources.list.d/siakhooi-apt.list > /dev/null
sudo curl -L https://siakhooi.github.io/apt/siakhooi-apt.gpg  | sudo tee /usr/share/keyrings/siakhooi-apt.gpg > /dev/null
sudo apt update
sudo apt install siakhooi-ore
```
### Rpm
```
sudo curl -L https://siakhooi.github.io/rpms/siakhooi-rpms.repo | sudo tee /etc/yum.repos.d/siakhooi-rpms.repo > /dev/null
sudo yum install siakhooi-ore
```

## Requirements
- `yq`
- `jv`

## Binaries
- `ore-config`
- `ore-config-{set,edit}`
- `ore-config-artifacts-{sample, validate}`
- `ore-version`
