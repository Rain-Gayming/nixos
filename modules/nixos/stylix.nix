{pkgs, configs, ...}:
{
    # stylix
    stylix = {
        enable = true;
        autoEnable = false;
        base16Scheme = "${pkgs.base16-scemes}/share/themes/gruvbox-dark-medium.yaml";
        targets.kitty.enable = true;
    };
}
