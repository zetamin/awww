#!/bin/bash

# Start Docker daemon if not running
service docker status || service docker start

# Start Portainer container if not running
docker ps -a --format '{{.Names}}' | grep -q '^portainer$' || docker run -d --restart=always -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /data/portainer_data:/data --name portainer portainer/portainer

# Keep the script running
tail -f /dev/null
