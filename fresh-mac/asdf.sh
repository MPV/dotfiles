#/bin/bash -ex

asdf plugin add terraform

asdf plugin add helm

asdf plugin add nodejs
# Import the Node.js release team's OpenPGP keys to main keyring:
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf plugin add kubectl
asdf install kubectl 1.17.3
asdf global kubectl 1.17.3
