This project with a rust-project.json file fails to perform the cargo check successfully with rust-analyzer.

To see the issue, you must:
1. Build the image `docker build -t rust-project-json-test .`.
2. Run the container which drops you into a bash terminal: `docker run -it --rm rust-project-json-test`.
3. Open `nvim` and execute `:PlugUpdate` to download the LSP plugins.
4. Quit nvim and open run `nvim src/main.rs`. You should see a compilation error after a short wait.
5. Quit nvim and rename `rust-project.json.old` to `rust-project.json` and run `nvim src/main.rs` again. This time you shouldn't get any compilation errors.
