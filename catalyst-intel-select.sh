#!/bin/sh

function check_symlink {
  if [ -e $1 ] && ! [ -h $1 ]; then
    echo $1 isn\'t a symlink, quitting with no changes
    exit
  fi
}

check_symlink /usr/lib/xorg/modules/extensions/libglx.so
check_symlink /usr/lib/libGL.so.1.2
check_symlink /usr/lib/libGL.so.1
check_symlink /usr/lib/libGL.so
check_symlink /usr/lib32/libGL.so.1.2
check_symlink /usr/lib32/libGL.so.1
check_symlink /usr/lib32/libGL.so

if grep nomodeset /proc/cmdline; then
  echo "AMD"
  ln -snf /usr/lib/xorg/modules/extensions/fglrx/fglrx-libglx.so /usr/lib/xorg/modules/extensions/libglx.so
  ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 /usr/lib/libGL.so.1.2
  ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 /usr/lib/libGL.so.1
  ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 /usr/lib/libGL.so
  ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 /usr/lib32/libGL.so.1.2
  ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 /usr/lib32/libGL.so.1
  ln -sf /usr/lib32/fglrx/fglrx-libGL.so.1.2 /usr/lib32/libGL.so
  cp /etc/X11/xorg.conf.catalyst /etc/X11/xorg.conf
else
  echo "Intel"
  ln -sf /usr/lib/xorg/modules/extensions/libglx.xorg /usr/lib/xorg/modules/extensions/libglx.so
  ln -sf /usr/lib/mesa-libGL.so.1.2.0 /usr/lib/libGL.so.1.2
  ln -sf /usr/lib/mesa-libGL.so.1.2.0 /usr/lib/libGL.so.1
  ln -sf /usr/lib/mesa-libGL.so.1.2.0 /usr/lib/libGL.so
  ln -sf /usr/lib32/mesa-libGL.so.1.2.0 /usr/lib32/libGL.so.1.2
  ln -sf /usr/lib32/mesa-libGL.so.1.2.0 /usr/lib32/libGL.so.1
  ln -sf /usr/lib32/mesa-libGL.so.1.2.0 /usr/lib32/libGL.so
  cp /etc/X11/xorg.conf.intel /etc/X11/xorg.conf
fi
