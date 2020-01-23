#whut
{ stdenv, fetchFromGitHub }:
#this
{
  sddm-abstract-dark = stdenv.mkDerivation rec {
    pname = "sddm-abstract-dark-theme";
    version = "1.2";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/abstract-dark
    '';
    src = fetchFromGitHub {
      owner = "Simerax";
      repo = "abstractdark-sddm-theme";
      rev = "e817d4b27981080cd3b398fe928619ffa16c52e7";
      sha256 = "1si141hnp4lr43q36mbl3anlx0a81r8nqlahz3n3l7zmrxb56s2y";
    };
  };
}
