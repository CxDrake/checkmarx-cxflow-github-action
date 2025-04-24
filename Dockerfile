# Use CxFlow Base image (non-root)
FROM itskedar/mycxflow:00240099

# Temporarily switch to root to set permissions
USER root

# Copy scripts
COPY scripts/keytool-import-certs.sh /app/keytool-import-certs.sh
COPY entrypoint.sh /app/entrypoint.sh

# Set executable permissions (only root can do this)
RUN chmod +x /app/keytool-import-certs.sh /app/entrypoint.sh && \
    chown nonroot:nonrootgroup /app/keytool-import-certs.sh /app/entrypoint.sh

# Switch back to non-root
USER nonroot

ENTRYPOINT ["./entrypoint.sh"]
