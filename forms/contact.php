<?php

// Dirección donde recibirás los mensajes
$receiving_email_address = "vector.regional.consultores@gmail.com";

// Verifica que se hayan enviado los datos
if (
    !isset($_POST['name']) ||
    !isset($_POST['email']) ||
    !isset($_POST['subject']) ||
    !isset($_POST['message'])
) {
    die("Error: Missing fields");
}

// Captura los datos
$name = strip_tags($_POST['name']);
$email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
$subject = strip_tags($_POST['subject']);
$message = strip_tags($_POST['message']);

$headers = "From: $name <$email>\r\n";
$headers .= "Reply-To: $email\r\n";
$headers .= "Content-Type: text/plain; charset=UTF-8\r\n";

// Envía el mail
$sent = mail(
    $receiving_email_address,
    $subject,
    "Nombre: $name\nEmail: $email\n\nMensaje:\n$message",
    $headers
);

// Respuesta al AJAX
if ($sent) {
    echo "OK";
} else {
    echo "Error: mensaje no enviado.";
}

?>
