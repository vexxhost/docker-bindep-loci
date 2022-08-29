FROM quay.io/vexxhost/bindep:v2.11.0

ARG LOCI_SHA1=2537db07aa3a3836cd215281e2fe2aa7923706b0
ADD https://opendev.org/openstack/loci/raw/commit/${LOCI_SHA1}/bindep.txt /bindep.txt
ADD https://opendev.org/openstack/loci/raw/commit/${LOCI_SHA1}/pydep.txt /pydep.txt

ONBUILD ARG PROJECT
ONBUILD ARG PROFILES
ONBUILD RUN <<EOF
  bindep -f /bindep.txt -b -l newline ${PROJECT} ${PROFILES} python3 > /runtime-dist-packages
  bindep -f /pydep.txt -b -l newline ${PROJECT} ${PROFILES} python3 > /runtime-pip-packages
EOF
