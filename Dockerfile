# TeX Live base and biber
#
# Example usage:
# docker run --rm -v "$PWD"/tex:/usr/src/project -w /usr/src/project pdflatex-light /bin/bash -c 'pdflatex report.tex'
#
# Based on Dockerfile from https://gordonlesti.com/building-a-latex-docker-image/
FROM debian:9
LABEL maintainer "Jonathan King <jonathanlking@me.com>"

RUN apt-get update \
    && apt-get install -y \
    texlive-latex-base \
    && echo "\nmain_memory = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
    && echo "\nextra_mem_bot = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
    && echo "\nfont_mem_size = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
    && echo "\npool_size = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
    && echo "\nbuf_size = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
    && update-texmf \
    && texhash \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
