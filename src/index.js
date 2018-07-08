const puppeteer = require('puppeteer')
var args = []
if (process.env.CHROME_NO_SANDBOX) {
	args.push('--no-sandbox')
}

puppeteer.launch({headless: (process.env.CHROME_HEADLESS === 'true'), args})
	.then(async browser => {
		// have fun!
	})
	.catch(err => {
		// handle error
	})
	
