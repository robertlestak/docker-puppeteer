# docker-puppeteer

A headless Puppeteer client inside of a Docker container.

## Configuration

While the Puppeteer API and configuration is moving quickly, currently two variables must be set and passed into the Puppeteer instance:

````
CHROME_HEADLESS=true
CHROME_NO_SANDBOX=true
````
