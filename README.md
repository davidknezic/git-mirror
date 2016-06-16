# git-mirror

> Mirror a repository periodically from one remote to another.

## Usage

```sh
docker run \
  -e ORIGINAL_REPO="https://USER:PW@github.com/owner/repo" \
  -e MIRROR_REPO="https://USER:PW@example.com/mirrors/owner/repo.git" \
  -e CRON_STRING="*/5\t*\t*\t*\t*" \
  davidknezic/mirror
```

## Configuration

### ORIGINAL_REPO

This is your original repository.

It's mandatory to provide this value.

### MIRROR_REPO

This is the repository you want to mirror to.
Please note that all the previous commits will be
irreversibly replaced by the original repository.

It's mandatory to provide this value.

### CRON_STRING

This configuration value defines how often
the original repository should get mirrored into
the other one.

It follows the Cron standard.

Default is every 5 minutes. (`*/5\t*\t*\t*\t*"`)

## License

The MIT License (MIT)

Copyright (c) 2016 David Knezić
