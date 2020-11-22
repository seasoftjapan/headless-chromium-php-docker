<?php
require_once "vendor/autoload.php";

use HeadlessChromium\BrowserFactory;

$browserFactory = new BrowserFactory("/usr/bin/google-chrome");

$browser = $browserFactory->createBrowser([
	'sendSyncDefaultTimeout' => 30000
]);

$page = $browser->createPage();

$page->setUserAgent('Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36');

$page->navigate("https://en.wikipedia.org/wiki/HelloWorld")->waitForNavigation();

$title = $page->evaluate('document.title')->getReturnValue();

echo $title;
?>
