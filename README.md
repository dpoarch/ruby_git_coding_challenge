# Ruby coding challenge

this project uses github_api to perform events on a gitrepo.

## Ruby | Git Setup

1. Run `bundle install` to install required gems

Optional use without typing the command by just running the following:
```bash
run_bundle_install.sh
```

2. Rename `.env.sample` to `.env`

3. Inside `.env` Configure Git credentials, Repository name and Personal Access token:

```js
ACCESS_TOKEN=
GIT_USERNAME=
GIT_EMAIL=
GIT_REPO=Sample-test1


PUSH_FILE=sample.txt
```

Replace `ACCESS_TOKEN` with your personal access token, you can get your personal access token by following the instruction in [Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)

## Run Scripts
Run the following on CLI/Bash/Shell :

```bash
ruby ./scripts/add_create_commit_push_script.rb
```

```bash
ruby ./scripts/update_commit_push.script.rb
```

```bash
ruby ./scripts/delete_pushed_file.rb
```

```bash
ruby ./scripts/create_issue_event_script.rb
```

```bash
ruby ./scripts/add_watch_script.rb
```

```bash
ruby ./scripts/add_events_scripts.rb
```

```bash
ruby ./scripts/pull_request_script.rb
```

```bash
ruby ./scripts/get_repo_list_script.rb
```
Some alternative method you could run the shell script without typing each commands:

```bash
add_create_commit_push_script.sh
add_events_scripts.sh
add_starring_script.sh
create_issue_event_script.sh
delete_pushed_file.sh
pull_request_script.sh
get_repo_list_script.sh
update_commit_push.script.sh
```


## Run Test
Run the following command to run all Test Cases:

```bash
bundle exec rspec
```

Optional use:

```bash
run_testcases.sh
```

End