import puppeteer from "puppeteer";
import util from "util";
import { exec } from "child_process";

const execPromise = util.promisify(exec);

async function generatePDF() {
  await execPromise("node preprocess-markdown.js");
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  await page.setViewport({
    width: 1348,
    height: 759,
    deviceScaleFactor: 1,
  });

  await page.goto(`http://127.0.0.1:8080`, {
    waitUntil: "networkidle0",
  });

  await page.pdf({
    path: "slides.pdf",
    preferCSSPageSize: true,
    printBackground: true,
  });

  await browser.close();
}

generatePDF().catch(console.error);
