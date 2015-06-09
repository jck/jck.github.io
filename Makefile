all: build
.PHONY: bundle serve build

bundle:
	bundle check --path .bundle || bundle install --jobs $(shell nproc) --path .bundle

serve: bundle
	bundle exec jekyll serve

build: bundle
	bundle exec jekyll build
