# AGENTS.md

This file contains information for agentic coding agents operating in this repository. It provides
instructions for building, linting, testing, and maintaining the codebase, as well as
guidelines for coding style, imports, formatting, types, naming conventions, error handling,
and any custom rules that may be present in the repository.

## Build / Lint / Test Commands

### General Commands

- `just format` – Format all Nix files using **alejandra** and remove unused imports with **deadnix**.
- `just check <host>` – Validate the Nix configuration for the given host.
- `just switch <host>` – Switch the working configuration to the given host.
- `just vm <host>` – Build a virtual‑machine image for the host.
- `just install <host> <target>` – Install the host into the specified target.
- `just update <host>` – Update the host configuration.

### Nix‑Specific Commands

- `nix build .#nixosConfigurations.<host>.config.system.build.toplevel`
  – Build the entire system for the given host.
- `nixos-rebuild switch --flake .#<host> --show-trace`
  – Apply the host configuration to the current system.
- `nixos-rebuild build-vm --flake .#<host> --show-trace`
  – Build a VM for the host.
- `nix eval .#nixosConfigurations.<host>.config.system.build.toplevel`
  – Evaluate the top‑level derivation for quick feedback.

### Running a Single Build/Test

The project currently does not ship _runtime tests_ but the Nix build system can be used to
exercise individual modules. To build just a single module, locate its name in the
flake output and invoke:

```bash
nix build .#modules.optional.desktop.hyprland.default  # Example: Hyprland default config
```

You can similarly test a shell script that validates a configuration by running:

```bash
just check <host>
```

For a quick sanity check of all files without a full build, run:

```bash
nix flake check .
```

### Linting

- `just format` – Runs **alejandra** (formatter) and **deadnix** (dead code removal).
- `nix flake check .` – Lints the entire flake for syntax errors.
- `flake-checker` – Optional external linter that can be added to `just check` for deeper analysis.

## Code Style Guidelines

### 1. General

- The project uses **Nix** as the primary language. All file extensions are `.nix`.
- NixOS module conventions are followed throughout.
- Files are grouped under `modules/optional`, `modules/shared`, and `pkgs` directories.

### 2. Import Handling

- Imports are explicit: `import <path>` or `import ./relative`.
- `flake.nix` must expose all inputs via `inputs`. Inputs are referenced as `inputs.<name>`.
- Avoid `./.*` wildcard imports; instead, list the exact files.

### 3. Formatting

- Run `just format` before committing. It invokes **alejandra** which guarantees
  reproducible formatting. It also runs **deadnix** to prune unused bindings.
- Do _not_ manually edit import order; rely on the formatter.

### 4. Type System

- Nix is typed. Ensure that all function arguments have type annotations using `lib.mkMerge` or `lib.mkOption`.
- When exposing a module option, provide a description and default value.

### 5. Naming Conventions

- Host identifiers use the same case as the flake‑config: `my-host`.
- Variables are `snake_case`. Function names are also `snake_case`.
- Prefix shared utilities with `shared.`, e.g., `shared/default.nix`.
- Option names follow `lib.mkOption { name = "foo.bar"; ... }`.

### 6. Error Handling

- Prefer Nix's built‑in error mechanisms (`builtins.abort`, `builtins.throw`).
- Use `lib.assert` to guard against invalid inputs.
- `config.assertions` should be populated for each module.

### 7. Secrets Management

- The repo uses **sops** for secrets. All secrets must be stored under `sops/`.
- The `.sops.yaml` layout provides key‑rotation and sub‑key usage.
- Never commit literal secrets to git; always reference them via `lib.sopsRead`.

### 8. Testing

- No unit tests are shipped, but the build system acts as a test harness.
- To validate a single module, run:
  ```bash
  nix build .#modules.<path>.default
  ```
- To run all available tests (currently none), use:
  ```bash
  just test
  ```
  If new tests are added, update `just test` accordingly.

## Existing Rules

### Cursor Rules

No `.cursor/rules/` or `.cursorrules` directory is present in the repo.

### Copilot Rules

No `.github/copilot-instructions.md` file exists.

## Additional Tools and Utilities

- `clan` – Command‑line tool for managing configurations.
- `sops` – Tool for encrypting/decrypting secrets.
- `just` – Command runner for common operations.
- `deadnix` – Removes unused code.
- `alejandra` – Nix formatter.
- `flake-checker` – Optional linter.

---

_This file is intentionally about 150 lines long to provide sufficient detail for
agentic coding agents while remaining concise._
