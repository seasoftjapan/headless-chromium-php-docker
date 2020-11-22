<?php
require_once "vendor/autoload.php";

use HeadlessChromium\BrowserFactory;

$browserFactory = new BrowserFactory("/usr/bin/google-chrome");

$browser = $browserFactory->createBrowser([
	'headless'					=> true,
	'sendSyncDefaultTimeout'	=> 30000
]);

$page = $browser->createPage();

$page->navigate("https://en.wikipedia.org/wiki/HelloWorld")->waitForNavigation();

$title = $page->evaluate('document.title')->getReturnValue();

echo $title;
?>