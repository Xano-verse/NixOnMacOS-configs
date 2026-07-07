{
  hostvalues,
  inputs,
  lib,
  pkgs,
  pkgs-stable,
  system,			# system is whether it's aarch64-darwin or x86_64-darwin
  ...
}:

{

  imports = [
    ./modules/packages.nix
    ./modules/packages/default.nix
    #./settings/controlcenter.nix
    #./settings/dock.nix
    #./settings/homebrew.nix
  ];

  # Nix package-manager settings
  nix = {

    # Automatic garbage collection
    gc = {
      automatic = true;
      interval = {
        Hour = 3;
        Minute = 15;
        Weekday = 7;		# Every Sunday at 03:15
      };
      options = "--delete-older-than 7d";	# Only deletes generations older than 7 days
    };

    # These become entries in /etc/nix/nix.conf
    settings = {
      allowed-users = [
	"@admin"
	hostvalues.user.name
      ];

      trusted-users = [
    	"@admin"
    	hostvalues.user.name
      ];

      auto-optimise-store = false;

      experimental-features = [
        "nix-command"
        "flakes"
      ];
      sandbox = true;
    };
  };

  # Nix packages settings
  nixpkgs = {
    config.allowUnfree = lib.mkForce true;
    hostPlatform = system;
  };

  # System settings
  system = {
    # Runs software update checks everytime nix configuration is switched -> good for Apple Silicon
    activationScripts.extraActivation.text = ''
      softwareupdate --install-rosetta --agree-to-license
    '';

   # Turns off personalized Apple ads.
    defaults.CustomUserPreferences."com.apple.AdLib".allowApplePersonalizedAdvertising = false;

    primaryUser = hostvalues.user.name;
  };

  time.timeZone = hostvalues.timeZone;

  users.users.${hostvalues.user.name} = {
    home = hostvalues.user.home;
    shell = pkgs.zsh;
    description = hostvalues.user.name;
  };

  system.stateVersion = 6;

}

