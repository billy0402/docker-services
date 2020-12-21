mc alias set myminio ${CONSOLE_MINIO_SERVER} ${MINIO_ACCESS_KEY} ${MINIO_SECRET_KEY} --api S3v4
mc admin user add myminio ${CONSOLE_ACCESS_KEY} ${CONSOLE_SECRET_KEY}
cat > consoleAdmin.json << EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "admin",
            "Effect": "Allow",
            "Action": [
                "admin:*"
            ]
        },
        {
            "Sid": "s3-admin",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::*"
            ]
        }
    ]
}
EOF
mc admin policy add myminio consoleAdmin consoleAdmin.json
mc admin policy set myminio consoleAdmin user=${CONSOLE_ACCESS_KEY}