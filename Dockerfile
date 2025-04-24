# Use CxFlow Base image (non-root)
FROM itskedar/mycxflow:00240099

# Temporarily switch to root for permission changes
USER root

# Set working directory where files will live
WORKDIR /app

# Copy and make scripts executable
COPY scripts/keytool-import-certs.sh /app/keytool-import-certs.sh
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/keytool-import-certs.sh /app/entrypoint.sh && \
    chown nonroot:nonrootgroup /app/keytool-import-certs.sh /app/entrypoint.sh

# Switch to non-root user
USER nonroot

# Use absolute path for ENTRYPOINT
ENTRYPOINT ["/app/entrypoint.sh"]
