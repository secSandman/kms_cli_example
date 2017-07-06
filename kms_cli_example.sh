//Check out the basic output
aws kms encrypt –key-id arn: <foor/bar> –plaintext “mySqlPassword”
//Notice that the output returns the full object with an array of properties
//We don’t want that so try
aws kms encrypt –key-id arn: <foor/bar> –plaintext “mySqlPassword” –query CiphertextBlob –output text
//KMS encode the response so let’s decode for later use
aws kms encrypt –key-id arn: <foor/bar> –plaintext “mySqlPassword” –query CiphertextBlob –output text | base64 -D
//No that it’s working let’s output to a file for later use
aws kms encrypt –key-id arn: <foor/bar> –plaintext “mySqlPassword” –query CiphertextBlob –output text | base64 -D > mySQLPasswordFile
//Reverse the operation so we can dycrypt the ciphertext to plaintext
aws kms decrypt –ciphertext-blob fileb://mySqlpwd –output text –query Plaintext | base64 -D