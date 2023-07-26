FROM ubuntu

COPY layers/ /

ENTRYPOINT /entrypoint.sh
