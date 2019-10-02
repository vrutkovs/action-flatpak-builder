#!/bin/bash

set -e
cd "${1}"
[[ -d repo ]] || ostree init --mode=archive-z2 --repo=repo
[[ -d repo/refs/remotes ]] || mkdir -p repo/refs/remotes && touch repo/refs/remotes/.gitkeep

flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user install -y flathub ${2}

flatpak-builder --force-clean --ccache --require-changes --repo=repo \
		--subject="Nightly build of ${3}, `date`" app ${4}

flatpak build-update-repo --prune --prune-depth=20 --generate-static-deltas repo
	rm -rf repo/.lock
