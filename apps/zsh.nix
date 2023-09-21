{
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