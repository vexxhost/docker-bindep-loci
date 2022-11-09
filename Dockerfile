FROM quay.io/vexxhost/bindep:v2.11.0

ARG LOCI_SHA1=7dd55124c3d4a1368d027575332eb0e045b426ce
ADD https://opendev.org/openstack/loci/raw/commit/${LOCI_SHA1}/bindep.txt /bindep.txt
ADD https://opendev.org/openstack/loci/raw/commit/${LOCI_SHA1}/pydep.txt /pydep.txt

ONBUILD ARG PROJECT
ONBUILD ARG PROFILES
ONBUILD RUN <<EOF
  bindep -f /bindep.txt -b -l newline ${PROJECT} ${PROFILES} python3 > /runtime-dist-packages
  bindep -f /pydep.txt -b -l newline ${PROJECT} ${PROFILES} python3 > /runtime-pip-packages
EOF
