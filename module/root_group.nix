{ config, lib, ... }:

with lib;
with lib.types;

let
  cfg = config.gitlab.rootGroup;
in
{
  options.gitlab.rootGroup = {
    id = mkOption {
      default = "\${data.gitlab_group.root.id}";
      type = str;
      description = ''
        Terraform reference to the id of the group.
        Used for convienience when referencing the group in other resources.
        Should not be overriden, the default value should be fine.
      '';
    };
    groupId = mkOption {
      default = null;
      type = nullOr int;
      description = ''
        ID of the root group.
      '';
    };
  };

  config.data."gitlab_group".root = mkIf (cfg.groupId != null) {
    group_id = cfg.groupId;
  };
}
