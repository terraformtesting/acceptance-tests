# acceptance-tests
Acceptance Testing For `terraform-provider-github`

## Usage

```
- name: Acceptance Tests
  uses: terraformtesting/acceptance-tests@v1.2.0
  with:
    RUN_FILTER: ${{ env.RUN_FILTER }}
    GITHUB_BASE_URL: https://api.github.com/
    GITHUB_ORGANIZATION: terraformtesting
    GITHUB_TEST_USER: github-terraform-test-user
    GITHUB_TEST_USER_NAME: github-terraform-test-user
    GITHUB_TEST_USER_EMAIL: github-terraform-test-user@github.com
    GITHUB_TEST_USER_TOKEN: ${{ secrets.GITHUB_TEST_USER_TOKEN }}
    GITHUB_TEST_COLLABORATOR: github-terraform-test-collaborator
    GITHUB_TEST_COLLABORATOR_TOKEN: ${{ secrets.GITHUB_TEST_COLLABORATOR_TOKEN }}
    GITHUB_TEMPLATE_REPOSITORY: terraform-template-module
    GITHUB_TEMPLATE_REPOSITORY_RELEASE_ID: 23826477
```
