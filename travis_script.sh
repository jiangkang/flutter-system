#!/usr/bin/env bash
set -e

#for PROJECT_NAME in "${PROJECT_NAMES[@]}"
#do
#    echo "== Testing '${PROJECT_NAME}' on Flutter's $FLUTTER_VERSION channel =="
#    pushd "${PROJECT_NAME}"
#
#    # Run the analyzer to find any static analysis issues.
#    ../flutter/bin/flutter analyze
#
#    # Run the formatter on all the dart files to make sure everything's linted.
#    ../flutter/bin/flutter format -n --set-exit-if-changed .
#
#    # Run the actual tests.
#    ../flutter/bin/flutter test
#
#    popd
#done

../flutter/bin/flutter analyze

../flutter/bin/flutter format -n --set-exit-if-changed .

echo "-- Success --"