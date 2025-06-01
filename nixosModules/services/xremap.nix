{
    ...
}:
{
  services.xremap = {
    userName = "squed";
    yamlConfig = ''
      - name: main remaps
        remap:
          CapsLock:
            held: leftctrl
            alone: esc
            alone_timeout_millis: 150
    '';
  };
}