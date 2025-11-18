{pkgs, ...}: {
  home.packages = with pkgs; [
    (
      let
        my-python-packages = python-packages:
          with python-packages; [
            uv
            debugpy
          ];
        python-with-my-packages = python312.withPackages my-python-packages;
      in
        python-with-my-packages
    )
  ];
}
