FROM smebberson/alpine-consul-nodejs:5.11.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Build the npm modules.
COPY root/app/package.json /app/package.json
RUN cd /app && npm install --production

# Add the remaining source (excluding `root/app/node_modules` thanks to `.dockerignore`).
COPY root /

# Listen on port 4000.
EXPOSE 4000
