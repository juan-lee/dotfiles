docker-build:
	docker build -t dotfiles-nix-test .

docker-run:
	docker run -it --rm dotfiles-nix-test

# For local testing without Docker
switch:
	home-manager switch --flake .#jpang

# For macOS
switch-darwin:
	home-manager switch --flake .#jpang@darwin

.PHONY: docker-build docker-run switch switch-darwin