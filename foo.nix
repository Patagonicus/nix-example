{ stdenvNoCC
, fetchFromGitHub
}:
stdenvNoCC.mkDerivation {
  name = "foo";

  src = fetchFromGitHub {
    owner = "Patagonicus";
    repo = "nix-example";
    rev = "d1b9238309cc95f4b147aab641d3abb955ce482f";
    sha256 = "sha256-AUgh3up9hEvDqW75VHnCkM1eSA2ClRJwmTBHvpZPa0Y=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp -a foo.sh $out/bin/foo.sh
  '';
}
