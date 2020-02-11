#!/bin/bash -l

# Parse Action inputs into environment variables
export GITHUB_ORGANIZATION=${INPUT_GITHUB_ORGANIZATION}
export GITHUB_TEST_USER=${INPUT_GITHUB_TEST_USER}
export GITHUB_TEST_USER_TOKEN=${INPUT_GITHUB_TEST_USER_TOKEN}
export GITHUB_TEST_USER_NAME=${INPUT_GITHUB_TEST_USER_NAME}
export GITHUB_TEST_USER_EMAIL=${INPUT_GITHUB_TEST_USER_EMAIL}
export GITHUB_TEST_COLLABORATOR=${INPUT_GITHUB_TEST_COLLABORATOR}
export GITHUB_TEST_COLLABORATOR_TOKEN=${INPUT_GITHUB_TEST_COLLABORATOR_TOKEN}
export GITHUB_TEMPLATE_REPOSITORY=${INPUT_GITHUB_TEMPLATE_REPOSITORY}

# Set GITHUB_TOKEN
export GITHUB_TOKEN="${GITHUB_TEST_USER_TOKEN}"

# Setup Go Environment
go mod init
go mod tidy
go mod vendor

# Pre-Sweeper
go test -v -sweep="gh-region"

# Acceptance Tests
# FIXME: Running one test case per UNIX process yields less flaky results
test_cases () {
  grep -nr "func Test" . | grep -v vendor | \
  cut -d ' ' -f 2 | cut -d "(" -f 1 | grep TestAcc
}
run_test () {
  TF_ACC=1 go test -v -timeout 30m  ./... -run $1
}
for test_case in $(test_cases); do
   unset test_case_failed_${test_case}
   if ! run_test $test_case; then
    export test_case_failed_${test_case}=1
  fi
done

# Post-Sweeper
go test -v -sweep="gh-region"

# Exit with a failure if any test cases failed
for failed_test_case in $(env | grep "test_case_failed_"); do
  exit 1
done
