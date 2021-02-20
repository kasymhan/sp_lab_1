FROM ubuntu:latest

COPY find_search.sh ./
RUN chmod +x find_search.sh
CMD /bin/bash find_search.sh

