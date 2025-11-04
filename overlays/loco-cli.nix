final: prev: {
  loco-cli = prev.loco-cli.overrideAttrs (oldAttrs: {
    version = "0.12.0";
    src = prev.fetchCrate {
      pname = "loco-cli";
      version = "0.12.0";
      hash = "sha256-076lkfgpiy28ys4y4b2h02gfx0qdrp0c6c8a5sn2yddh6lcdhgdb";
    };
    cargoHash = "sha256-076lkfgpiy28ys4y4b2h02gfx0qdrp0c6c8a5sn2yddh6lcdhgdb";
  });
}
