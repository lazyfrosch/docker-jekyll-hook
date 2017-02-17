Jekyll Hooked for Docker
========================

This image runs a Jekyll site with a nginx web server.

* The site get's pulled and generated from a git repository
* A GitHub hook can trigger updates of the site
* Jekyll is running in background and refreshing the site on git changes

## Running and Configuration

See `docker-compose.yml`, or run with `docker run`

	docker-run \
		--name jekyll \
		-e REPO_URL=https://github.com/myuser/website.git \
		-e REPO_BRANCH=master \
		-e GITHUB_TOKEN=asecrettoallowgithubtriggering \
		-p 8080:80 \
		lazyfrosch/jekyll-hook

## Hook

To setup the hook configure a webhook in GitHub:

	URL: https://mywebsite.com/hooks/github?token=asecrettoallowgithubtriggering
    Content-Type: application/json
    Secret: leave empty
    Trigger: just push

## Contribution

Feel free to share your thoughts and issues on [GitHub](https://github.com/lazyfrosch/docker-jekyll-hook).

Pull requests are welcome, when they improve the image in general.

## License

    Copyright (C) 2017 Markus Frosch <markus@lazyfrosch.de>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
