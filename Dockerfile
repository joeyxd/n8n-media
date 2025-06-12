# Dockerfile for combined services
FROM no-code-architects-toolkit:latest as main-app

FROM n8nio/n8n

# Copy necessary files from main-app
COPY --from=main-app /app /main-app

# Install supervisor to manage multiple processes
RUN apt-get update && apt-get install -y supervisor

# Create supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Set environment variables for n8n
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_BASIC_AUTH_ACTIVE=true

# Expose both ports
EXPOSE 8080 5678

# Start supervisor which will start both services
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
