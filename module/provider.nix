{ lib, config, ... }:

with lib;
with lib.types;

let
  cfg = config.gitlab.provider;
in
{
  options.gitlab.provider.enable = mkEnableOption "GitLab provider";

  config = mkIf cfg.enable {
    terraform.required_providers.gitlab = mkDefault {
      source = "gitlabhq/gitlab";
    };
    provider.gitlab = mkDefault { };
  };
}
