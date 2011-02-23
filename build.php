<?php
$key = ''; // Post-Commit Authentication Key
$ignorecommits = array('Edited wiki page through web user interface.');
$data = file_get_contents("php://input");
$digest = hash_hmac("md5", $data, $key);
$hook = $_SERVER["HTTP_GOOGLE_CODE_PROJECT_HOSTING_HOOK_HMAC"];
if (!$hook || ($hook != $digest)) die("bad google auth!");
$data = json_decode($data, true);
if (in_array($data['revisions'][0]['message'], $ignorecommits)) die("ingnored commit");
echo `svn update && make`
?>
