# photo-3ds

## Dev Workflow
1. Run `docker compose build` to build the image.
2. Run `docker compose up -d` to start and detach the container.
3. Run `docker exec -it <service name> bash` to start a new shell in the container.
4. Run `cargo 3ds run --address <ip>` to build and run the homebrew application on the 3ds.
