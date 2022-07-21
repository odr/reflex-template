{ reflex-platform ? ((import <nixpkgs> {}).fetchFromGitHub {
    owner = "reflex-frp";
    repo = "reflex-platform";
    rev = "a4664e3b99f1b89a77ac759501b6bd85e18eac95";
    sha256 = "1pjzjhj966rs16f4b80ir9v8d7g7q2aa0i0zs30fny3x0xk1b4ah";
    })
}:
(import reflex-platform {}).project ({ pkgs, ... }:{
  useWarp = true;
  withHoogle = false;

  packages = {
    reflex-template = ../reflex-template;
  };

  overrides = let
    aesonInflectionsSrc = builtins.fetchGit {
      url = "http://github.com/typeable/aeson-inflections.git";
      rev = "66ac49cc1e468f36bf9d6c78b73bdabcfca0855d";
    };
    controlHasSrc = builtins.fetchGit {
      url = "http://github.com/typeable/control-has.git";
      rev = "42beb50adeaba74af08f22d31e1fa3fab4525b45";
    };
    countryCodesSrc = builtins.fetchGit {
      url = "https://github.com/typeable/country-codes.git";
      rev = "05d68730f2ba1e02d62de556205f34a1a2eef55a";
    };
    creditCardSrc = builtins.fetchGit {
      url = "http://github.com/typeable/credit-card.git";
      rev = "a505cb6cb77a61e1f871892b7ebee2b1947ce17b";
    };
    derivingOpenapi3Src = builtins.fetchGit {
      url = "https://github.com/ilyakooo0/deriving-openapi3";
      rev = "526a8fded63d2ab5ef0f29bf3156bde3e1873cd6";
    };
    digitSrc = builtins.fetchGit {
      url = "http://github.com/typeable/digit.git";
      rev = "e03f087c90c9228a9ae52a0e516eba22589eef94";
    };
    emailSrc = builtins.fetchGit {
      url = "http://github.com/typeable/email.git";
      rev = "34f36f5dd76e7f1a498d04e548cd4cdbb0eba38e";
    };
    emailValidateExtraSrc = builtins.fetchGit {
      url = "http://github.com/typeable/email-validate-extra.git";
      rev = "0ebb2d1c9d9dfdaadd3c21a781c94c977209ee26";
    };
    entropySrc = builtins.fetchGit {
      url = "https://github.com/TomMD/entropy.git";
      rev = "0916ac52d1bf36cc048fd2486c6abf10b1e09cd4";
    };
    extraTimeSrc = builtins.fetchGit {
      url = "http://github.com/typeable/extra-time.git";
      rev = "cfc87256b3753ae4e9badbc6bf136a269fac4db4";
    };
    flatSrc = builtins.fetchGit {
      url = "https://github.com/Quid2/flat.git";
      rev = "59314709b4b79c1cf6d1084ec4ad88b905d4b5f9";
    };
    generic-arbitrarySrc = builtins.fetchGit {
      url = "https://github.com/typeable/generic-arbitrary.git";
      rev = "84c62a4de517c78e5080f5451714ce7944987ba6";
      ref = "older-quickcheck" ;
    };
    idSrc = builtins.fetchGit {
      url = "http://github.com/typeable/id.git";
      rev = "c87476a92962941586ff87a37107cde50e8bc9f8";
    };
    missingLensSrc = builtins.fetchGit {
      url = "http://github.com/typeable/missing-lens.git";
      rev = "328659fdda8fd7ec509abfab6298775062fc2926";
    };
    obeliskSrc = builtins.fetchGit {
      url = "https://github.com/obsidiansystems/obelisk.git";
      rev = "e3ec75f6988eed47189dd20f8c8514748b33ea81";
    };
    openapi3Src = builtins.fetchGit {
      url = "https://github.com/typeable/openapi3.git";
      rev = "931f04300f9b569b9f8cacbc5adf74591f8cb6e5";
      ref = "patch_deps_322";
    };
    randomTokenSrc = builtins.fetchGit {
      url = "https://github.com/typeable/random-token.git";
      rev = "d71f750b21bef9e9c298c181e6b921ac019f7bb6";
    };
    reflexDomExtraSrc = builtins.fetchGit {
      url = "http://github.com/typeable/reflex-dom-extra.git";
      rev = "3d1461129395fc469903d132e82d4be142e5d7c2";
    };
    servantExtraApiSrc = builtins.fetchGit {
      url = "https://github.com/typeable/servant-extra-api.git";
      rev = "8c884ae593afeaa9c292cb1ce0756ffc98718b98";
    };
    servantOpenapi3Src = builtins.fetchGit {
      url = "https://github.com/biocad/servant-openapi3.git";
      rev = "4165b837d3a71debd1059c3735460075840000b5";
    };
    servantReflexSrc = builtins.fetchGit {
      url = "https://github.com/imalsogreg/servant-reflex" ;
      rev = "a6f859e52857e0eda753cf113fabfff61f06da6a" ;
    } ;
    validationtSrc = builtins.fetchGit {
      url = "http://github.com/typeable/validationt.git";
      rev = "c943f92ac2a9cd77482a8fa0ca2e2cf768426283";
    };
    dont = p : with pkgs.haskell.lib; dontHaddock (dontCheck p);
  in self: super: with pkgs.haskell.lib; {
    aeson-inflections = dontCheck (super.callCabal2nix "aeson-inflections" aesonInflectionsSrc { });
    bifunctors = super.callHackage "bifunctors" "5.5.7" {};
    control-has = dontCheck (super.callCabal2nix "control-has" controlHasSrc { });
    country-codes = dontCheck (super.callCabal2nix "country-codes" countryCodesSrc { });
    credit-card = dontCheck (super.callCabal2nix "credit-card" creditCardSrc { });
    dependent-sum-template = dont (super.callHackage "dependent-sum-template" "0.1.0.3" {});
    deriving-openapi3 = dont (super.callCabal2nix "deriving-openapi3" derivingOpenapi3Src { });
    digit = dontCheck (super.callCabal2nix "digit" digitSrc { });
    email = dontCheck (super.callCabal2nix "email" emailSrc { });
    email-validate-extra = dontCheck (super.callCabal2nix "email-validate-extra" emailValidateExtraSrc { });
    entropy = dontCheck (super.callCabal2nix "entropy" entropySrc { });
    extra-time = dontCheck (super.callCabal2nix "extra-time" extraTimeSrc { });
    flat = dontCheck (super.callCabal2nix "flat" flatSrc { });
    generic-arbitrary = (super.callCabal2nix "generic-arbitrary" generic-arbitrarySrc { });
    generic-deriving = super.callHackage "generic-deriving" "1.13.1" {};
    gi-glib = dontCheck super.gi-glib;
    hotels-api-common = dontHaddock super.hotels-api-common;
    hotels-front-commons = dontHaddock super.hotels-front-commons;
    gi-javascriptcore = dontCheck super.gi-javascriptcore;
    http-media = dont super.http-media;
    id = dontCheck (super.callCabal2nix "id" idSrc { });
    invariant = dont (super.callHackage "invariant" "0.5.3" {});
    missing-lens = dontCheck (super.callCabal2nix "missing-lens" missingLensSrc { });
    obelisk-executable-config-lookup = (super.callCabal2nix "obelisk-executable-config-lookup" "${obeliskSrc}/lib/executable-config/lookup" { });
    obelisk-route =  (super.callCabal2nix "obelisk-route" "${obeliskSrc}/lib/route" { });
    openapi3 = dont (doJailbreak (super.callCabal2nix "openapi3" openapi3Src { }));
    orders-api = dontHaddock super.orders-api;
    orders-frontend = dontHaddock super.orders-frontend;
    quickcheck-instances = dont (super.callHackage "quickcheck-instances" "0.3.25.2" {});
    random-token = dontCheck (super.callCabal2nix "random-token" randomTokenSrc { });
    reflex-dom-core = dontCheck super.reflex-dom-core;
    reflex-dom-extra = super.callCabal2nix "reflex-dom-extra" reflexDomExtraSrc {};
    servant-extra-api = dontCheck (super.callCabal2nix "servant-extra-api" servantExtraApiSrc { });
    servant-openapi3 = dont (doJailbreak (super.callCabal2nix "servant-openapi3" servantOpenapi3Src { }));
    servant = doJailbreak (super.callHackage "servant" "0.18.2" {});
    servant-reflex = doJailbreak (super.callCabal2nix "servant-reflex" servantReflexSrc {});
    tabulation =  (super.callCabal2nix "tabulation" "${obeliskSrc}/lib/tabulation" { });
    th-abstraction = dont (super.callHackage "th-abstraction" "0.3.2.0" {});
    time-compat = dont (super.callHackage "time-compat" "1.9.6" {});
    travolutionary-types = dontHaddock super.travolutionary-types;
    universe-base = dont super.universe-base;
    uri-bytestring = doJailbreak super.uri-bytestring;
    validationt = super.callCabal2nix "validationt" validationtSrc {};

  } // pkgs.lib.optionalAttrs (!(super.ghc.isGhcjs or false)) {
    aeson = dontCheck (doJailbreak (super.callHackage "aeson" "1.4.7.1" {}));
  };

  shellToolOverrides = ghc: super: {
    closure-compiler = null;
    haskell-ide-engine = null;
    hdevtools = null;
    hlint = null;
    stylish-haskell = null;
    hoogle = null;
  };

  shells = {
    ghc = ["reflex-template"];
    ghcjs = ["reflex-template"];
    ghc8_10 = ["reflex-template"];
    ghcjs8_10 = ["reflex-template"];
  };
})
