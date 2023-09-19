{
    self,
    nixpkgs,
    ...
}:
{
    architeuthis = nixpkgs.lib.nixosSystem {
        system = "x86_64_linux";
        modules = [ ./architeuthis ];
    };
}