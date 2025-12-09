FROM nginx:stable-alpine

LABEL maintainer="mishrsan002-star"

# Copy site contents into nginx html directory.
# If your repo already contains the built static site (index.html, assets, etc),
# this is sufficient. If you need a build step (Jekyll/Hugo/Node), use a multi-stage build instead.
COPY . /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:80/ >/dev/null || exit 1

CMD ["nginx", "-g", "daemon off;"]
