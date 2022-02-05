#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testDetect()
{
  detect

  assertEquals 0 ${rtrn}
  assertEquals "dbmate" "$(cat ${STD_OUT})"
  assertEquals "" "$(cat ${STD_ERR})"
}
