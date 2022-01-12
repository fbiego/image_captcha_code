<?php

//	/public_html/test.php
//	/verify/

$dir = "../verify/";

$json = json_decode(file_get_contents( $dir . "mapping.json") , true);
$c = count($json) - 1;

function image($loc)
{
    return base64_encode(file_get_contents($loc));
}


session_start();

if ($_POST["submit"])
{
    
    if ($_POST["code"] == $_SESSION['code'])
    {
        $recipient = "aa@bbb.com";	// receiver's email
        $subject = "Email Subject";
        $name = $_POST["name"];
        $email = $_POST["email"];
        $message = $_POST["message"];
        $title = $_POST["subject"];

        $mailBody = "Name: $name\nEmail: $email\n$title\n\n$message";

        mail($recipient, $subject, $mailBody, "From: $name <$email>");

        echo '<script>alert("Thank you for you feedback")</script>';

    }
    else
    {
        echo '<script>alert("Wrong code")</script>';

    }

}

$rand = rand(0, $c);	// generate random number


$code = $json[$rand];	// get object
foreach ($code as $k => $v)
{
    $image = $dir . $k . ".jpg";
}
$_SESSION['code'] = $v;	// save the code value to session

?>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Image Captcha</title>
</head>

<body>

<form method="POST">
  <label>Name</label><br>
  <input type="text" name="name" required/><br><br>
  <label>Email</label><br>
  <input type="text" name="email" required/><br><br>
  <label>Subject</label><br>
  <input type="text" name="subject" required/><br><br>
  <label>Message</label><br>
  <input type="text" name="message" required/><br><br>
  <label>Enter Code</label><br>
  <img src='data:image/png;base64,<?= image($image); ?>' height="100px" alt="code"><br>
  <input type="number" name="code" required/><br><br>
  <input type="submit" name="submit" value="Submit">
</form> 

</body>

</html>