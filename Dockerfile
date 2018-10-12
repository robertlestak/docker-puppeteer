FROM ubuntu:16.04

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y curl git && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs

RUN apt-get update && apt-get install -y wget --no-install-recommends \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-unstable \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /src/*.deb \
    && apt-get update \
    && apt-get install -y curl

COPY . .

RUN npm install --save puppeteer && npm install

# Add pptr user.
RUN groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
    && mkdir -p /home/pptruser/Downloads \
    && chmod -R 755 /home/pptruser \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser node_modules

# Run user as non privileged.

RUN chown -R pptruser:pptruser /usr/src/app

USER pptruser

CMD ["node", "src/index"]
