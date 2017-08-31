<h1 align="center">static-site-buildpack</h1>

<p align="center">
Heroku buildpack for running NGINX in front of a static site.
</p>

### Features
* **Custom build script**. Decide how to build your own site when deploying. No need to version build artifacts.
* **Optional password authentication**. For protected sites, the option is available to protect all assets with basic auth using an htpasswd file. Great for staging or development sites!
* **Choose the version of NGINX**. Just set the environment variable for a valid version.

## Usage
This buildpack is commonly added on top of an existing Heroku buildpack.
For example, if you have a site that needs to be built using npm, add this buildpack after the heroku/nodejs buildpack.

```
heroku buildpacks:add https://github.com/jcomo/static-site-buildpack.git
```

On the next deploy NGINX will be built and deployed alongside your static site.
By default the static root is set as `www/data` but can be configured.

## Configuration

| Name                      | Default           | Description                                                                           |
| ------------------------- | ----------------- | ------------------------------------------------------------------------------------- |
| `NGINX_VERSION`           | 1.11.3            | The version of NGINX to build. To change, the cache must be purged first              |
| `NGINX_ROOT`              | www/data          | The directory serving the static site                                                 |
| `NGINX_FORCE_SSL`         | false             | Forces requests to https if enabled                                                   |
| `NGINX_ALLOW_POST`        | false             | Allows access to static content using the POST method (will result in 405 otherwise)  |
| `NGINX_BUILD_SCRIPT`      | bin/build_site.sh | The location of the script that will build the site                                   |
| `NGINX_NOCACHE_FILETYPES` | (none)            | The file extensions to not put under cache control (useful for development servers)   |
| `NGINX_HTPASSWD`          | (none)            | The location of the htpasswd file to protect the site. Will be unprotected if not set |
| `NGINX_WORKERS`           | 2                 | The number of NGINX workers (don't change without good reason)                        |
