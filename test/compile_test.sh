#!/bin/sh

. "$BUILDPACK_TEST_RUNNER_HOME/lib/test_utils.sh"

testCompile()
{
  compile
  assertEquals 0 "${rtrn}"
  assertEquals "" "$(cat "$STD_ERR")"

  assertContains "-----> Downloading dbmate-2.21.0"  "$(cat "$STD_OUT")"
  assertTrue "Should have cached dbmate $(ls -la "$CACHE_DIR")" "[ -f $CACHE_DIR/dbmate_2.21.0_linux_amd64 ]"
  assertFileMD5 "25951c590a15d6a65657dbf25ccc9b89" "$CACHE_DIR/dbmate_2.21.0_linux_amd64"

  assertContains "-----> Installing dbmate-2.21.0"  "$(cat "$STD_OUT")"
  assertTrue "Should have installed dbmate in build dir: $(ls -la "$BUILD_DIR")" "[ -d $BUILD_DIR/.dbmate ]"

  assertContains "-----> Installing profile.d script"  "$(cat "$STD_OUT")"
  assertTrue "Should have installed .profile.d/dbmate.sh in build dir: $(ls -la "$BUILD_DIR/.profile.d")" "[ -x $BUILD_DIR/.profile.d/dbmate.sh ]"
  assertFileMD5 "4b125ca049a96edddfbd950203a9bc95" "$BUILD_DIR/.profile.d/dbmate.sh"

  # Run again to ensure cache is used
  rm -rf "${BUILD_DIR:?}/*"

  compile
  assertNotContains "-----> Downloading dbmate"  "$(cat "$STD_OUT")"
  assertContains "-----> Installing dbmate"  "$(cat "$STD_OUT")"

  assertEquals 0 "${rtrn}"
  assertEquals "" "$(cat "$STD_ERR")"

  capture "${BUILD_DIR}/.dbmate/bin/dbmate --version"
  assertEquals 0 "${rtrn}"
  assertContains "dbmate version 2.21.0" "$(cat "$STD_OUT")"
  assertEquals "" "$(cat "$STD_ERR")"
}
