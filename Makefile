# Building GetNighthawk project site

jekyll=bundle exec jekyll
jekyll_production=JEKYLL_ENV=production $(jekyll)
jekyll_preview=JEKYLL_ENV=preview $(jekyll)

setup:
	bundle install

site:
	$(jekyll) serve --drafts --livereload --config _config.yml

build:
	$(jekyll_production) build --config _config.yml $(if $(BASEURL),--baseurl "$(BASEURL)") $(if $(SITE_URL),--url "$(SITE_URL)")

build-preview:
	$(jekyll_preview) build --config _config.yml --baseurl "$(BASEURL)" --url "$(SITE_URL)"

docker:
	docker run --name getnighthawk --rm -p 4000:4000 -v `pwd`:"/srv/jekyll" jekyll/jekyll:4.0.0 bash -c "bundle install; jekyll serve --drafts --livereload --config _config.yml"