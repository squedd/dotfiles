{
    pkgs,
    vars,
    ...
}:
{
    users.users.${vars.user} = {
        shell = pkgs.zsh;
    };

    programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        initExtra = ''
        bindkey '^f' autosuggest-accept
        '';
    };
}