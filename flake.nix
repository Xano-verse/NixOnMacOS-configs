{
    description = "Xan's darwin system";

    inputs = {
	# Use `github:NixOS/nixpkgs/nixpkgs-26.05-darwin` to use Nixpkgs 26.05.
    	nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    	# Use `github:nix-darwin/nix-darwin/nix-darwin-26.05` to use Nixpkgs 26.05.
    	nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    	nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ self, nix-darwin, nixpkgs }:
    let
	system = "aarch64-darwin";		# For Apple Silicon CPUs
     	#system = "x86_64-darwin";		# For Intel CPUs
    in {
	darwinConfigurations."PTYHW2N740D2" = nix-darwin.lib.darwinSystem {
	    inherit system;

     	    specialArgs = {
	    	inherit inputs system;
	    	hostvalues = {
	    	    hostname = "PTYHW2N740D2";
	    	    timeZone = "Europe/Lisbon";
	    	    user = {
		    	name = "adl445";
		    	home = "/Users/adl445";
	    	    };
	    	};
     	    };

      	    modules = [ ./system/configuration.nix ];
    	};
    };
}
