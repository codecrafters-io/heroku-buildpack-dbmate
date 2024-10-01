Heroku buildpack: dbmate
=========================

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks) that
allows one to run [`dbmate`](https://github.com/amacneil/dbmate) in a dyno alongside application code.

Usage
-----

Example usage:

    $ heroku buildpacks:add https://github.com/codecrafters-io/heroku-buildpack-dbmate

    $ git push heroku master
    ...

    remote: -----> dbmate app detected
    remote: -----> Installing dbmate-2.21.0.... done
    remote: -----> Installing profile.d script.... done

    ...

    $ heroku run 'dbmate --version'
    Running `dbmate --version` attached to terminal... up, run.3706
    dbmate version 2.21.0

Testing
-------

This buildpack is tested using [heroku-buildpack-testrunner](https://github.com/heroku/heroku-buildpack-testrunner).

[Build the `heroku/buildpack-testrunner` docker image](https://github.com/heroku/heroku-buildpack-testrunner#docker-usage) 
and then run this command to run tests: 

```shell
docker run -it -v $(pwd):/app/buildpack:ro heroku/testrunner
```
