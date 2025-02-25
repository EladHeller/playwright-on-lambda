import {chromium} from 'playwright';

export async function handler() {
    let browser;
    try {
        browser = await chromium.launch({
            headless: true,
            args: [
                '--no-sandbox',
                '--disable-setuid-sandbox',
                '--disable-dev-shm-usage',
                '--disable-gpu',
                '--single-process',
                '--no-zygote',
              ],
        });
        const page = await browser.newPage();
        await page.goto('https://example.com');
        const title = await page.title();
        console.log({title});
    } catch (error) {
        console.log(error.message);
        throw error;
    } finally {
        if (browser) {
            await browser.close();
        }
    }
}