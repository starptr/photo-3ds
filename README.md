# photo-3ds

## Dev Workflow
1. Run `docker compose build` to build the image.
2. Run `docker compose up -d` to start and detach the container.
3. Run `docker exec -it <service name> bash` to start a new shell in the container.
4. Run `cargo 3ds run --address <ip>` to build and run the homebrew application on the 3ds.

### Debugging
TODO: use Citra
For now, you can try following [these instructions](https://bmaupin.github.io/wiki/other/3ds/3ds-debugging.html).

### Testing
[`custom_test_frameworks`](https://doc.rust-lang.org/beta/unstable-book/language-features/custom-test-frameworks.html)
