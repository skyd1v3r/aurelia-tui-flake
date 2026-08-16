{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
}:

rustPlatform.buildRustPackage rec {
  pname = "aurelia-tui";
  version = "0.1.3";

  src = fetchFromGitHub {
    owner = "Drackrath";
    repo = "Aurelia-TUI";
    rev = "v${version}";
    hash = "sha256-+kk+sczxwCk7N33wVM32n4tl3G+Jt5AWMF3tcK/vT8Y=";
  };

  cargoHash = "sha256-roOxtWQDk9BSo44z62uWQi/yrZVu5bZUL4+UKkehEIk=";

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ];

  meta = with lib; {
    description = "TUI client for Aurelia Steam CLI";
    homepage = "https://github.com/Drackrath/Aurelia-TUI";
    mainProgram = "aurelia-tui";
  };
}
