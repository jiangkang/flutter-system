#!/usr/bin/env bash

if test "$1"="driver"; then
   flutter drive --target=test_driver/app.dart
fi

