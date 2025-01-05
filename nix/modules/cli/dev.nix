{pkgs, ...}:
{
 home.packages = with pkgs; [
  # Rust
  (fenix.combine [
   fenix.stable.toolchain
  ])

  # Go
  go

  # JS/TS
  nodejs-slim
  deno
 ];
}
