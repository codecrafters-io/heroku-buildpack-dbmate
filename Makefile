.PHONY: test

test:
	docker run -v $$(pwd):/app/buildpack:ro heroku/testrunner

