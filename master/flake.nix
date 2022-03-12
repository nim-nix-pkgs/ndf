{
  description = ''Duplicate files finder'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-ndf-master.flake = false;
  inputs.src-ndf-master.owner = "rustomax";
  inputs.src-ndf-master.ref   = "refs/heads/master";
  inputs.src-ndf-master.repo  = "ndf";
  inputs.src-ndf-master.type  = "github";
  
  inputs."docopt".dir   = "nimpkgs/d/docopt";
  inputs."docopt".owner = "riinr";
  inputs."docopt".ref   = "flake-pinning";
  inputs."docopt".repo  = "flake-nimble";
  inputs."docopt".type  = "github";
  inputs."docopt".inputs.nixpkgs.follows = "nixpkgs";
  inputs."docopt".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."murmurhash".dir   = "nimpkgs/m/murmurhash";
  inputs."murmurhash".owner = "riinr";
  inputs."murmurhash".ref   = "flake-pinning";
  inputs."murmurhash".repo  = "flake-nimble";
  inputs."murmurhash".type  = "github";
  inputs."murmurhash".inputs.nixpkgs.follows = "nixpkgs";
  inputs."murmurhash".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-ndf-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-ndf-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}