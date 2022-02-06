# docker-stylua

[![Build Status][build-badge]][build] [![Docker Pulls][docker-badge]][docker]
[![GitHub][github-badge]][github]

A small Docker image for [StyLua][], an opinionated Lua code formatter.

**Table of Contents**

<!-- toc -->

- [Getting the Image](#getting-the-image)
- [Usage](#usage)
- [Issues](#issues)
- [Contributing](#contributing)
- [Authors](#authors)
- [License](#license)

<!-- tocstop -->

## Getting the Image

The image is hosted on Docker Hub and can be pulled down with:

```console
$ docker pull fnichol/stylua
```

## Usage

By default, `stylua` will be run with no arguments:

```console
$ docker run --rm -ti fnichol/stylua
error: no files provided

```

To format Lua files in your current directory, mount your current directory into
the container as read-only:

```console
$ docker run --rm -ti -v "$(pwd)":/src:ro -w /src fnichol/stylua --check .
```

## Issues

If you have any problems with or questions about this image, please contact us
through a [GitHub issue][issues].

## Contributing

You are invited to contribute to new features, fixes, or updates, large or
small; we are always thrilled to receive pull requests, and do our best to
process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub
issue][issues], especially for more ambitious contributions. This gives other
contributors a chance to point you in the right direction, give you feedback on
your design, and help you find out if someone else is working on the same thing.

## Authors

Created and maintained by [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>).

## License

This Docker image is licensed under the [MIT][license] license. The StyLua
project is also licensed under the [MIT][stylua-license] license.

[build-badge]: https://api.cirrus-ci.com/github/fnichol/docker-stylua.svg
[build]: https://cirrus-ci.com/github/fnichol/docker-stylua
[docker-badge]: https://img.shields.io/docker/pulls/fnichol/stylua.svg
[docker]: https://hub.docker.com/r/fnichol/stylua
[fnichol]: https://github.com/fnichol
[github-badge]: https://img.shields.io/github/tag-date/fnichol/docker-stylua.svg
[github]: https://github.com/fnichol/docker-stylua
[issues]: https://github.com/fnichol/docker-stylua/issues
[license]: https://github.com/fnichol/docker-stylua/blob/master/LICENSE.txt
[stylua-license]: https://github.com/JohnnyMorganz/StyLua/blob/master/LICENSE.md
[stylua]: https://github.com/JohnnyMorganz/StyLua
