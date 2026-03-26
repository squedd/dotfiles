{ self, inputs, ...}: {
  flake.nixosModules.vscode = { pkgs, system, config, ...}: {
    programs.vscode = {
      enable = true;
      # profiles.default = {
      #   enableExtensionUpdateCheck = false;
      #   enableUpdateCheck = false;
      #   userSettings = {
      #     "editor.wordWrap" = "on";
      #     "editor.insertSpaces" = true;
      #     "editor.tabSize" = 2;
      #     "editor.detectIndentation" = true;
      #     "files.autoSave" = "onFocusChange";

      #     "update.showReleaseNotes" = false;
      #     "extensions.autoUpdate" = false;
      #   };
      # };
    };
  };
}