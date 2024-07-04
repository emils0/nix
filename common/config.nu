# $env.PATH = ($env.PATH | split row (char esep) | prepend /home/emil/.nix-profile/bin/ | append ~/.dotnet/tools)

$env.config = {
  show_banner: false,
}
