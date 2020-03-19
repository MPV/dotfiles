#!/usr/bin/env python

import os

def plugin(plugin, versions):
    os.system('asdf plugin add {}'.format(plugin))
    global_version = ''
    for version in versions:
        os.system('asdf install {} {}'.format(plugin, version))
        global_version = version
    os.system('asdf global {} {}'.format(plugin, version))
    print

plugin("terraform", ["0.12.23"])
plugin("helm", ["2.16.3", "3.1.1"])
plugin("kubectl", ["1.17.3"])
plugin("kustomize", ["3.5.4"])
plugin("golang", ["1.14"])

os.system('asdf plugin add nodejs')
hasNodeJs = os.system('asdf which node')
if hasNodeJs != 0:
    # Import the Node.js release team's OpenPGP keys to main keyring:
    os.system('bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring')
    os.system('asdf install nodejs 13.10.1')
    os.system('asdf global nodejs 13.10.1')
