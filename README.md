# Minimum Reproducible Example for Cargo-Chef Issue #108

Issue: https://github.com/LukeMathWalker/cargo-chef/issues/108

## Running

The following command pattern was used

```bash
docker build . --no-cache | stripcolors | tee build-{with/without}-toml.log
```

(stripcolors is an alias)