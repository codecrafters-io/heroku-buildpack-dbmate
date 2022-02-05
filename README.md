Heroku buildpack: gh
=========================

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks) that
allows one to run [`gh`](https://github.com/cli/cli) (GitHub's official command line tool) in a dyno 
alongside application code.

Usage
-----

Example usage:

    $ heroku config:set GITHUB_TOKEN=`<github-personal-access-token>`

    $ heroku buildpacks:add https://github.com/codecrafters-io/heroku-buildpack-gh

    $ git push heroku master
    ...

    remote: -----> gh app detected
    remote: -----> Installing gh-2.5.0.... done
    remote: -----> Installing profile.d script.... done

    ...

    $ heroku run 'gh --version'
    Running `gh --version` attached to terminal... up, run.3706
    gh version 2.5.0 (2022-02-01)
    https://github.com/cli/cli/releases/tag/v2.5.0

Testing
-------

This buildpack is tested using [heroku-buildpack-testrunner](https://github.com/heroku/heroku-buildpack-testrunner).

[Build the `heroku/buildpack-testrunner` docker image](https://github.com/heroku/heroku-buildpack-testrunner#docker-usage) 
and then run this command to run tests: 

```shell
docker run -it -v $(pwd):/app/buildpack:ro heroku/buildpack-testrunner
```
