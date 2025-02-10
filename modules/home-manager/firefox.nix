{pkgs, lib, ...}:

{
    programs.firefox = {
        enable = true;
        search = {
            force = true;
            default = "DuckDuckGo";
        };

        extensions = with pkgs.inputs.firefox-addons; [
            ublock-origin
        ];
    };

}
