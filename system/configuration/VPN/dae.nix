{
  config,
  pkgs,
  inputs,
  ...
}:

{

  environment.systemPackages = with inputs.daeuniverse.packages.x86_64-linux; [
    dae
    daed
  ];

  services.dae = {
    enable = true;

    openFirewall = {
      enable = true;
      port = 12345;
    };
  };

}
