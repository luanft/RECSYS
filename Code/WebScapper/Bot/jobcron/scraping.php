<?php
$root = 'E:/JOBS_RECOMMENDATION/trunk/SourceCode/Bot/WebScraper/';
require_once $root . '/lib/download.php';
require_once $root . '/model/Model.php';
require_once $root . '/model/config.php';
require_once $root . '/lib/download.php';
require_once $root . '/lib/xpath.php';
require_once $root . '/lib/simple_html_dom.php';
$_SERVER ["DOCUMENT_ROOT"] = $root;

// global variable
$xpathModel = null;
$jobModel = null;
$xpathData = null;
$total_pages = 10;
function ws_init_system() {
	global $xpathModel;
	global $xpathData;
	global $jobModel;
	$xpathModel = new XPathModel ();
	$xpathData = $xpathModel->getAll ();
	$jobModel = new JobModel();
}
// login to webserver
// param: xpath table
function ws_login_to_webserver($xpathData) {
	foreach ( $xpathData as $row ) {
		try {
			login ( $row ['login_url'], $row ['login_data'], "cookie" . $row ['id'] . ".txt" );
			echo "Successfully loged to: " . $row ['id'] . "\n";
		} catch ( Exception $e ) {
		}
	}
	return true;
}
// param: xpath,url,base
function ws_get_job_url($home_url, $based_url, $xpath) {
	// return data
	$links = array ();
	try {
		// get web content
		$data = curl_download_old ( $home_url );
		if ($data != '') {
			// extract job url
			$html = new simple_html_dom ();
			$html->load ( $data );
			$xml_nodes = get_xpath_node ( $html, $xpath );
			if ($xml_nodes) {
				// lay url
				foreach ( $xml_nodes as $node ) {
					$links [] = $based_url . $node->href;
				}
			}
		}
	} catch ( Exception $ex ) {
	}
	return $links;
}
function ws_get_detail_job($url, $job, $company, $location, $description, $salary, $requirement, $benifit, $expired, $tag, $cookie) {
	global $jobModel;
	$data = curl_download_old ( $url, $cookie );
	if ($data != '') {
		// dismiss warning!
		libxml_use_internal_errors ( true );
		$doc = new DOMDocument ();
		$doc->loadHTML ( $data );
		$domXpath = new DOMXPath ( $doc );
		// lay data
		$djob = trim ( lay_du_lieu ( $domXpath, $job ) );
		// in case of xpath query error
		if ($djob != '') {
			// get general data
			$dcompany = trim ( lay_du_lieu ( $domXpath, $company ) );
			$dlocation = trim ( lay_du_lieu ( $domXpath, $location ) );
			$ddes = trim ( lay_du_lieu ( $domXpath, $description ) );
			$dsalary = trim ( lay_du_lieu ( $domXpath, $salary ) );
			$drequirement = trim ( lay_du_lieu ( $domXpath, $requirement ) );
			$dbenifit = trim ( lay_du_lieu ( $domXpath, $benifit ) );
			$dexpired = trim ( lay_du_lieu ( $domXpath, $expired ) );
			if ($dexpired == '')
				$dexpired = date ( "m" ) + 1 . "-" . date ( "d" ) . "-" . date ( "Y" );
				// get tag
			$dtag = "";
			$tag_nodes = get_nodes_list ( $domXpath, $tag )->item ( 0 );
			if ($tag_nodes->hasChildNodes ()) {
				for($i = 0; $i < $tag_nodes->childNodes->length; $i ++) {
					$tg = $tag_nodes->childNodes->item ( $i )->nodeValue;
					if (trim ( $tg ) != "")
						$dtag .= $tg . "|";
				}
				// remove last separator
				substr ( $dtag, 0, - 1 );
			}
			// save data
			if (! $jobModel->isExist ( $url )) {
				$ret = $jobModel->AddNewJob ( "1", $djob, $dlocation, $dsalary, 
						$ddes, $dcompany, $dtag, $drequirement, $dbenifit, $dexpired, $url );
				return $ret;
			}
		}
	}
	return false;
}
function ws_save_job() {
}

?>