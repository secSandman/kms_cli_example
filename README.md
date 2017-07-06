# AWS KMS CLI
AWS KMS CLI Demo code and CLI Commands. Visit www.securitysandman.com or visit secsandman on YouTube to follow along and learn the basics of AWS Security Groups.  CF code snippets, cloud formation templates, and scripts. Enjoy

# Step by Step 

Log into AWS console
IAM –> Keys –>Create Key
  Key Alias
  Description
  Region
  Set Role
  Set User
  
Validate policy allows the user or role associated with the AWS Access Key and Secret Access Keys
Hop back to your local development environment
  AWS configure
  Validate Region is same region as KMS keys
  KMS keys are region specific, your CLI calls wont work if your in the wrong region
  
Check out the basic output
  aws kms encrypt –key-id arn: <foor/bar> –plaintext “mySqlPassword”
  
Notice that the output returns the full object with an array of properties

We don’t want that so try
  aws kms encrypt –key-id arn: <foor/bar> –plaintext “mySqlPassword” –query CiphertextBlob –output text
  
KMS encode the response so let’s decode for later use
  aws kms encrypt –key-id arn: <foor/bar> –plaintext “mySqlPassword” –query CiphertextBlob –output text | base64 -D
  
No that it’s working let’s output to a file for later use
  aws kms encrypt –key-id arn: <foor/bar> –plaintext “mySqlPassword” –query CiphertextBlob –output text | base64 -D > mySQLPasswordFile

Reverse the operation so we can dycrypt the ciphertext to plaintext
  aws kms decrypt –ciphertext-blob fileb://mySqlpwd –output text –query Plaintext | base64 -D
