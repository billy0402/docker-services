mc config host add myminio ${MCS_MINIO_SERVER} ${MINIO_ACCESS_KEY} ${MINIO_SECRET_KEY} --api s3v4
mc admin user add myminio ${MCS_ACCESS_KEY} ${MCS_SECRET_KEY}
cat > mcsAdmin.json << EOF
{
	"Version": "2012-10-17",
	"Statement": [
        {
			"Action": [
				"admin:*"
			],
			"Effect": "Allow",
			"Sid": "s01"
		},
		{
			"Action": [
                "s3:*"
			],
			"Effect": "Allow",
			"Resource": [
				"arn:aws:s3:::*"
			],
			"Sid": "s02"
		}
	]
}
EOF
mc admin policy add myminio mcsAdmin mcsAdmin.json
mc admin policy set myminio mcsAdmin user=${MCS_ACCESS_KEY}