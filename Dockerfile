FROM docker.io/vrutkovs/flatpak

LABEL version="1.0.0"
LABEL repository="http://github.com/vrutkovs/action-flatpak-builder"
LABEL homepage="http://github.com/vrutkovs/action-flatpak-builder"
LABEL maintainer="Vadim Rutkovsky"
LABEL "com.github.actions.name"="FlatpakBuild"
LABEL "com.github.actions.description"="Build flatpak"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="purple"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
