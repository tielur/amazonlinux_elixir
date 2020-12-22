FROM amazonlinux:2018.03.0.20190118

ARG ERLANG_VER="22.3"
ARG ELIXIR_VER="1.11.2"

# Set locale to en_US.UTF-8
RUN localedef -c -f UTF-8 -i en_US en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install dependencies
RUN yum install -y gcc gcc-c++ glibc-devel ncurses-devel openssl-devel autoconf wget unzip findutils git ImageMagick && yum clean all

ENV ERLANG_DIR=/opt/erlang \
    ELIXIR_DIR=/opt/elixir

# Install Erlang
WORKDIR /tmp
RUN mkdir -p otp && \
    curl -LS "http://erlang.org/download/otp_src_${ERLANG_VER}.tar.gz" --output otp.tar.gz && \
    tar xfz otp.tar.gz -C otp --strip-components=1
WORKDIR otp/
RUN ./configure && make && make install

# Install Elixir
ENV LC_ALL en_US.UTF-8
WORKDIR /tmp
RUN mkdir -p elixir && \
    curl -LS "https://github.com/elixir-lang/elixir/archive/v${ELIXIR_VER}.tar.gz" --output elixir.tar.gz && \
    tar xfz elixir.tar.gz -C elixir --strip-components=1
WORKDIR elixir/
RUN make install -e PATH="${PATH}:/usr/local/bin"


# Install node
RUN curl --silent --location https://raw.githubusercontent.com/nodesource/distributions/master/rpm/setup_8.x | bash -
RUN yum -y install nodejs

ENV PATH=/opt/erlang/bin:/opt/elixir/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

