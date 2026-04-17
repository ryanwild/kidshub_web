FROM ghcr.io/getzola/zola:v0.22.1 AS zola

COPY . /project
WORKDIR /project
RUN ["zola", "build", "--output-dir", "/srv", "--minify", "--force"]

FROM caddy:2.11.2-alpine
COPY --from=zola /srv /srv
COPY ./Caddyfile /etc/caddy/Caddyfile

