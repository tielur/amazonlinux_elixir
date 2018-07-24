#FROM amazonlinux:2016.09.1.20161221-with-sources
FROM amazonlinux:2016.09.1.20161221

ARG ERLANG_VER="20.3"
ARG ELIXIR_VER="1.6.5"

# Install dependencies
RUN yum install -y gcc glibc-devel ncurses-devel openssl-devel autoconf wget unzip findutils && yum clean all

ENV ERLANG_DIR=/opt/erlang \
    ELIXIR_DIR=/opt/elixir

# Install Erlang/OTP
RUN wget http://erlang.org/download/otp_src_$ERLANG_VER.tar.gz -O otp_src_$ERLANG_VER.tar.gz \
    && tar -zxf otp_src_$ERLANG_VER.tar.gz -C ~/ && cd ~/otp_src_$ERLANG_VER \
    && ./configure --prefix=$ERLANG_DIR && make -j4 && make install \
    && cd && rm -rf ~/otp_src_*

# Install Elixir
RUN wget https://github.com/elixir-lang/elixir/releases/download/v$ELIXIR_VER/Precompiled.zip -O Precompiled.zip \
    && unzip -q Precompiled.zip -d $ELIXIR_DIR && rm -f Precompiled.zip \
    && export PATH=$ERLANG_DIR/bin:$ELIXIR_DIR/bin:$PATH \
    && mix local.hex --force && mix local.rebar --force

ENV PATH=/opt/erlang/bin:/opt/elixir/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

