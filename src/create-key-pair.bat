set key_name=%1

aws ec2 create-key-pair --key-name "%key_name%" --query "KeyMaterial" --output text > "%key_name%.pem"

if exist "%key_name%.pem" (
    echo Key pair "%key_name%" created successfully and saved as "%key_name%".pem
) else (
    echo Failed to create key pair.
)