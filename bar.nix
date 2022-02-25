{ stdenvNoCC
, fetchFromGitHub
, lib
, makeWrapper
, foo
}:
stdenvNoCC.mkDerivation {
  name = "bar";

  src = fetchFromGitHub {
    owner = "Patagonicus";
    repo = "nix-example";
    rev = "517ac6c39fc8d481d57e1957e5be7f0523605ca6";
    sha256 = "sha256-3mg/omDoakovGNB958aCdqdTi6bQZLMDzexqYj6lHR4=";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    cp -a bar.sh $out/bin/bar.sh
    wrapProgram $out/bin/bar.sh --prefix PATH : ${lib.makeBinPath [ foo ]}
  '';
}
