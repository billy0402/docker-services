# https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/scanners/sonarscanner/

SONARQUBE_URL="http://127.0.0.1:9000"
CACHE_DIR="./volumes/scanner_cache"
TOKEN="your-token"
PROJECT_KEY="your-project"
REPO_PATH="${HOME}/your-repo"

docker run \
    --rm \
    -e SONAR_HOST_URL="${SONARQUBE_URL}"  \
    -v "${CACHE_DIR}:/opt/sonar-scanner/.sonar/cache" \
    -v "${REPO_PATH}:/usr/src" \
    sonarsource/sonar-scanner-cli:latest \
    -D"sonar.login=${TOKEN}" \
    -D"sonar.projectKey=${PROJECT_KEY}"

# ./sonar-scanner/bin/sonar-scanner \
#     -Dsonar.host.url=${SONARQUBE_URL} \
#     -Dsonar.login=${TOKEN} \
#     -Dsonar.projectKey=${PROJECT_KEY} \
#     -Dsonar.projectBaseDir=${REPO_PATH}
