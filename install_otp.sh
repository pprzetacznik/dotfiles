#!/bin/bash

set -xe

install_otp () {
  ERL_VERSION=23.1.2
  ERL_ZIP_NAME=OTP-$ERL_VERSION.zip
  ERL_TOP=~/OTP-$ERL_VERSION

  pushd ~/
    wget https://github.com/erlang/otp/archive/$ERL_ZIP_NAME
    unzip $ERL_ZIP_NAME -d $ERL_TOP
    rm $ERL_ZIP_NAME
  popd

  sudo apt install -y autoconf libncurses5-dev libncursesw5-dev
  sudo apt install -y libwxbase3.0-dev libssl-dev

  pushd $ERL_TOP
    ./autoconf
    ./configure --prefix=$ERL_TOP/target
    make
    make install
  popd
}

install_elixir () {
  IEX_VERSION=1.11.2
  ELIXIR_TOP=~/elixir_$IEX_VERSION
  IEX_ZIP=Precompiled.zip
  wget https://github.com/elixir-lang/elixir/releases/download/v$IEX_VERSION/$IEX_ZIP
  unzip $IEX_ZIP -d $ELIXIR_TOP
  rm $IEX_ZIP
}

install_ielixir_deps () {
  sudo apt install -y libzmq3-dev libsqlite3-dev
}

main () {
  install_otp
  install_elixir
  install_ielixir_deps
}

main
