<?php
  if(isset($_POST['submitButton'])){
  $apiToken = "689548019:AAEo1WNoz5X3cRkzu6vLizPU8E3wbuMkw6I";
  $email = $_POST['email'];
  $data = [
    'chat_id' => '-1001592328782', 
    'text' => "New subscriber \n" . $email . "\n"
  ];
  $response = file_get_contents("https://api.telegram.org/bot$apiToken/sendMessage?" .
                                 http_build_query($data) );
  }    
?>
