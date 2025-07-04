# n8n-media

A Digital Ocean App Platform deployment for running both n8n and a custom media processor service.

## Services

- **main-app**: A custom application running on port 8080
- **n8n**: Workflow automation tool running on port 5678

## Deployment Instructions

1. Push this repository to GitHub
2. In Digital Ocean App Platform, select this repository
3. Digital Ocean should auto-detect the services based on the .do/app.yaml file
4. Configure the environment variables for n8n authentication:
   - `N8N_BASIC_AUTH_USER`: Username for n8n login
   - `N8N_BASIC_AUTH_PASSWORD`: Password for n8n login
5. Deploy the app

## Environment Variables

The following environment variables need to be set in Digital Ocean:

- `N8N_BASIC_AUTH_USER`: Username for n8n access
- `N8N_BASIC_AUTH_PASSWORD`: Password for n8n access

## Persistent Storage

The n8n service uses a persistent volume to store workflow data. This ensures your workflows and credentials are preserved even if the container restarts.
