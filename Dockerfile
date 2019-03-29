FROM debian:stable

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update && \
	apt-get install --assume-yes --no-install-recommends \
		biber \
		make \
		texlive-bibtex-extra \
		texlive-fonts-extra \
		texlive-latex-extra \
		texlive-science \
		texlive-lang-german && \
	apt-get clean

CMD ["/usr/bin/make"]
