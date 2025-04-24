# Use CxFlow Base image (non-root)
FROM itskedar/mycxflow:00240099

# Use working directory owned by non-root
WORKDIR /app

# Copy scripts with correct permissions already set on host machine
COPY --chown=nonroot:nonrootgroup scripts/keytool-import-certs.sh ./keytool-import-certs.sh
COPY --chown=nonroot:nonrootgroup entrypoint.sh ./entrypoint.sh

# No need for chmod if files are already executable
# If needed, do chmod in entrypoint.sh instead

ENTRYPOINT ["./entrypoint.sh"]
