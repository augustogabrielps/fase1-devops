#!/usr/bin/env bash
set -euo pipefail

CONTAINER_NAME="devops-demo-app"
HEALTH_TIMEOUT=60
HEALTH_INTERVAL=5

if ! command -v docker &>/dev/null; then
    echo "ERROR: docker not found. Install Docker and try again." >&2
    exit 1
fi

echo "==> Pulling latest image..."
docker compose pull

echo "==> Starting container..."
docker compose up -d --force-recreate

echo "==> Waiting for '${CONTAINER_NAME}' to become healthy (timeout: ${HEALTH_TIMEOUT}s)..."
elapsed=0
while true; do
    status=$(docker inspect --format='{{.State.Health.Status}}' "${CONTAINER_NAME}" 2>/dev/null || echo "not_found")

    if [[ "${status}" == "healthy" ]]; then
        echo "==> Container is healthy."
        break
    fi

    if (( elapsed >= HEALTH_TIMEOUT )); then
        echo "ERROR: Timed out waiting for container to become healthy (last status: ${status})." >&2
        echo "--- Last 50 log lines ---" >&2
        docker logs --tail 50 "${CONTAINER_NAME}" >&2
        exit 1
    fi

    echo "    status: ${status} — retrying in ${HEALTH_INTERVAL}s... (${elapsed}s elapsed)"
    sleep "${HEALTH_INTERVAL}"
    (( elapsed += HEALTH_INTERVAL ))
done

echo ""
echo "Deploy successful! Application available at: http://localhost:8080/api/hello"
