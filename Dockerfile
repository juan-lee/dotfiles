FROM ubuntu:18.04

ENV HOME=/root \
         LC_ALL=en_US.UTF-8 \
         LANG=en_US.UTF-8 \
         LANGUAGE=en_US.UTF-8

COPY . $HOME/dotfiles

WORKDIR $HOME/dotfiles

RUN ./bootstrap

WORKDIR $HOME

CMD /bin/zsh
