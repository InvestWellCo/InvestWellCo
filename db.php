<?php
$host = 'localhost'; // اسم السيرفر
$db = 'invest_well'; // اسم قاعدة البيانات
$user = 'root'; // اسم المستخدم
$pass = ''; // كلمة المرور (قد تكون فارغة في بعض الإعدادات المحلية)

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>
