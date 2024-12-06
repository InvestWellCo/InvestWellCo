<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    include 'db.php'; // استدعاء ملف الاتصال

    // استلام البيانات من النموذج
    $name = $_POST['name'];
    $country_code = $_POST['country_code'];
    $phone = $_POST['phone'];
    $inquiry = $_POST['inquiry'];

    // إدخال البيانات في قاعدة البيانات
    $stmt = $pdo->prepare("INSERT INTO inquiries (name, country_code, phone, inquiry) VALUES (:name, :country_code, :phone, :inquiry)");
    $stmt->execute([
        ':name' => $name,
        ':country_code' => $country_code,
        ':phone' => $phone,
        ':inquiry' => $inquiry
    ]);

    // إعادة التوجيه إلى صفحة شكرًا
    header("Location: thank_you.html");
    exit();
}
?>
