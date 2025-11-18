{pkgs, ...}: {
  home.packages = with pkgs; [
    jdt-language-server
    kotlin-language-server
    ktlint
    gopls
    sqls
    rust-analyzer
    nil
    tailwindcss-language-server
    nodePackages.typescript-language-server
    nodePackages.svelte-language-server
  ];
}
