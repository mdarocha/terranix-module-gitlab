{ config, lib, ... }:

with lib;
with lib.types;

let
  cfg = config.gitlab.groups;
in
{
  options.gitlab.groups = mkOption {
    default = { };
    description = "Definition of a GitLab group";
    type = attrsOf (submodule ({ name, ... }: {
      options = {
        id = mkOption {
          default = "\${gitlab_group.${name}.id}";
          type = str;
          description = ''
            Terraform reference to the id of the group.
            Used for convienience when referencing the group in other resources.
            Should not be overriden, the default value should be fine.
          '';
        };
        name = mkOption {
          default = name;
          type = str;
          description = "The name of the group";
        };
        path = mkOption {
          default = name;
          type = str;
          description = "The path of the group";
        };
        description = mkOption {
          default = "";
          type = str;
          description = "The description of the group";
        };
        parentId = mkOption {
          type = str;
          description = "ID of the parent group";
        };
        settings = mkOption {
          default = { };
          type = anything;
          description = ''
            Any additional settings you may want to set.
            See the [gitlab_group resource](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/group)
            documentation for a list of possible values.
          '';
        };
      };
    }));
  };

  config.resource."gitlab_group" = mapAttrs
    (name: values:
      (values.settings // {
        inherit (values) name path description;
        parent_id = values.parentId;
      }))
    cfg;
}
