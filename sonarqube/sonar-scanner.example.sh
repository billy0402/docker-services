# https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/
docker run \
    --rm \
    -e SONAR_HOST_URL="http://127.0.0.1:9000" \
    -e SONAR_LOGIN="${your-token}" \
    -v $(pwd):/usr/src \
    sonarsource/sonar-scanner-cli \
    -D"sonar.projectKey=${your-project-key}"
