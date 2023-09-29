{
    pkgs,
    vars,
    ...
}:
{
    users.users.${vars.user} = {
        shell = pkgs.zsh;
    };

    programs = {
        zsh = {
            enable = true;
            syntaxHighlighting.enable = true;
            autosuggestions = {
                enable = true;
            };
            enableCompletion = true;
            histSize = 10000;
        };
    };
}