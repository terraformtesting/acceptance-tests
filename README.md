# acceptance-tests
Acceptance Testing For `terraform-provider-github`

## Usage

```
uses: terraformtesting/acceptance-tests@v1
with:
  GITHUB_ORGANIZATION: terraformtesting
  GITHUB_TEST_USER: github-terraform-test-user
  GITHUB_TEST_USER_TOKEN: ${{ secrets.GITHUB_TEST_USER_TOKEN }}
  GITHUB_TEST_COLLABORATOR: github-terraform-test-collaborator
  GITHUB_TEST_COLLABORATOR_TOKEN: ${{ secrets.GITHUB_TEST_COLLABORATOR_TOKEN }}
  GITHUB_TEMPLATE_REPOSITORY: terraform-template-module
```
