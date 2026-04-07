docker build -t postfix:latest .
docker tag postfix:latest ghcr.io/romeo0012/postfix:latest
GHCR_TOKEN=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
echo $GHCR_TOKEN | docker login ghcr.io -u romeo0012 --password-stdin
#docker system prune -a
docker push ghcr.io/romeo0012/postfix:latest
