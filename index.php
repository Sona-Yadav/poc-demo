<?php
$db_user = getenv('DB_USER') ?: 'not-set';
$db_pass = getenv('DB_PASS') ?: 'not-set';
$db_host = getenv('DB_HOST') ?: 'not-set';
function mask($s) {
  if ($s === 'not-set') return $s;
  $len = strlen($s);
  if ($len <= 4) return str_repeat('*', $len);
  return str_repeat('*', $len - 2) . substr($s, -2);
}
?>
<!doctype html>
<html>
<head><meta charset="utf-8"><title>Lifebulb POC</title></head>
<body>
  <h1>Lifebulb POC</h1>
  <p>DB Host: <?=htmlspecialchars($db_host)?></p>
  <p>DB User: <?=htmlspecialchars($db_user)?></p>
  <p>DB Pass (masked): <?=htmlspecialchars(mask($db_pass))?></p>
  <p>Server: <?php echo php_uname(); ?></p>
</body>
</html>
