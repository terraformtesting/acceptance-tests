# acceptance-tests
Acceptance Testing For `terraform-provider-github`

## Usage

```
acceptance-tests-individual:
  runs-on: ubuntu-latest
  steps:
    - name: Checkout
      uses: actions/checkout@v2
      with:
        ref: ${{ github.event.pull_request.head.ref }}
        fetch-depth: 2
    - name: Acceptance Tests (Individual)
      uses: terraformtesting/acceptance-tests@v2.0.0
      with:
        TF_LOG: DEBUG
        GITHUB_OWNER: github-terraform-test-user
        GITHUB_TEST_USER_TOKEN: ${{ secrets.GITHUB_TEST_USER_TOKEN }}
        GITHUB_TEST_ORGANIZATION: terraformtesting
```
