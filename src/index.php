<?php
require_once "vendor/autoload.php";

use HeadlessChromium\BrowserFactory;

$browserFactory = new BrowserFactory("/usr/bin/google-chrome");

$browser = $browserFactory->createBrowser([
	'headless'					=> false,
	'sendSyncDefaultTimeout'	=> 40000
]);

$page = $browser->createPage();

$page->navigate("https://it.wikipedia.org/wiki/Tom_Hardy")->waitForNavigation();

echo $page->evaluate('document.title')->getReturnValue();
?>
