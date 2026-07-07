{ config, pkgs, ... }:

{
	# Base system utilities only
	# Manter por ordem alfabetica
	environment.systemPackages = with pkgs; [
        	bash
        	bc          # basic calculator utility -> mostly for scripts
		btop

        	calc        # better terminal calculator for personal use

        	docker
		dysk

		fastfetch
        	firefox-unwrapped     # chosen over simple firefox due to the screen sharing on wayland + pipewire support (see firefox page on nix wiki and local firefox.nix)
		flameshot
		fzf

		gcc15
        	gdb         	# gnu debugger
		git
		gnumake		# make utility for compilation 

		#libgcc		# gcc and g++ and others

		mpv

		nerd-fonts.symbols-only
		nix-prefetch-git

		python313

		rar
		rustc

		texliveFull
		tree

		unrar
		unzip

		vim

		wget

		#zathura
		zip
	];
}
