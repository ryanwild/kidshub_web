NB

docker cp caddy:/data/caddy/pki/authorities/local/root.crt /path/on/host/root.crt

# Kids Hub

The original website was a Wordpress Blog.

To duplicate the website the origianl code was downloaded with the following script:

```bash
httrack "https://example.com" \
  -O "./website_backup" \
  -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" \
  -H "Accept-Language: en-US,en;q=0.5" \
  -H "Accept-Encoding: gzip, deflate, br, zstd" \
  -H "Update-Insecure-Requests: 1" \
  -H "DNT: 1" \
  -H "Sec-Fetch-Dest: document" \
  -H "Sec-Fetch-Mode: navigate" \
  -H "Sec-Fetch-Site: none" \
  -H "Sec-Fetch-User: ?1" \
  -H "Sec-GPC: 1" \
  --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:142.0) Gecko/20100101 Firefox/142.0" \
  -%v
```

Note that httrack was used to download the site and needs to be installed before running the above script.

## Project structure

The site consists of a static frontend built with Zola. And a Python backend that accepts form posts.

## Frontend

Zola is a static site builder see: [https://www.getzola.org/](https://www.getzola.org/)

The frontend has a custom theme built to match the original website design.

## Backend

The backend is a FastAPI Python server.

It has two endpoints that accept POST requests.

Each endpoint receives requests for the Contact form and Join Us forms.
