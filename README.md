# Git mirror

> Mirror a git repository periodically from one remote to another.

## Usage

```sh
docker run \
  -e ORIGINAL_REPO="https://USER:PW@github.com/owner/repo" \
  -e MIRROR_REPO="https://USER:PW@example.com/mirrors/owner/repo.git" \
  -e CRON_STRING="*/5\t*\t*\t*\t*" \
  davidknezic/git-mirror
```

## Configuration

### ORIGINAL_REPO

This is your original repository.

It's mandatory to provide this value.

### MIRROR_REPO

This is the repository you want to mirror to.
Please note that all the previous commits will be
irreversibly replaced by the original repository. (🚨)

It's mandatory to provide this value.

### CRON_STRING

This configuration value defines how often
the original repository should get mirrored into
the other one.

It follows the Cron standard, in which you can
set up the periodicity using 5 values, of which
each one is separated by a tab character (`\t`).

For custom intervals please have a look at this handy
[Cron expression reference](https://en.wikipedia.org/wiki/Cron#CRON_expression).

The default is every 5 minutes. (`*/5 * * * *`, separated with tabs `\t`)

### Environment variables

In some cases you might be forced to
provide environment variables to this container.
Common scenarios are having to configure git to use a proxy
or fixing the problem when pushing to a server with an invalid SSL certificate.

In both those cases you can simply provide additional environment
variables to the container, like this:

```sh
docker run \
  ... \
  -e HTTP_PROXY=http://proxy:8080 \
  -e HTTPS_PROXY=http://proxy:8080 \
  davidknezic/git-mirror
```

or

```sh
docker run \
  ... \
  -e GIT_SSL_NO_VERIFY=true \
  davidknezic/git-mirror
```

However, please note that the last example is considered very insecure.

Find other git environment variables in
[this reference](https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables).

## Contributions

Any feedback, issues and pull requests are very
welcome.

## License

The MIT License (MIT)

Copyright (c) 2016 David Knezić
