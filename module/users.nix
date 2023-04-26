{ config, lib, ... }:

with lib;
with lib.types;

let
  cfg = config.gitlab.users;
in
{
  options.gitlab.users = mkOption {
    default = { };
    description = ''
      Creates data objects for the given users.
      You can then get a terraform reference to the id of that user
      (for use in group or project options) using the .id option.
    '';
    type = attrsOf (submodule ({ name, ... }: {
      options = {
        id = mkOption {
          default = "\${data.gitlab_user.${name}.id}";
          type = str;
          description = ''
            Terraform reference to the id of the user.
            Used for convienience when referencing the user in other resources.
            Should not be overriden, the default value should be fine.
          '';
        };
        username = mkOption {
          default = name;
          type = str;
          description = "Username of the given user";
        };
      };
    }));
  };

  config.data."gitlab_user" = mapAttrs
    (_: values: {
      inherit (values) username;
    })
    cfg;
}
