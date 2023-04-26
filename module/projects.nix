{ config, lib, ... }:

with lib;
with lib.types;

let
  cfg = config.gitlab.projects;
in
{
  options.gitlab.projects = mkOption {
    default = { };
    description = "Definition of a GitLab project";
    type = attrsOf (submodule ({ name, ... }: {
      options = {
        id = mkOption {
          default = "\${gitlab_project.${name}.id}";
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
          description = "Name of the project";
        };
        description = mkOption {
          default = "";
          type = str;
          description = "Description of the project";
        };
        namespaceId = mkOption {
          type = str;
          description = "ID of the namespace (user or group) this project should be in.";
        };
        defaultBranch = mkOption {
          default = "main";
          type = str;
          description = "Name of the default branch";
        };
        settings = mkOption {
          default = {};
          type = anything;
          description = ''
            Any additional settings you may want to set.
            See the [gitlab_project resource](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project)
            documentation for a list of possible values.
          '';
        };
      };
    }));
  };

  config.resource."gitlab_project" = mapAttrs
    (_: values: values.settings // {
      inherit (values) name description;
      namespace_id = values.namespaceId;
      default_branch = values.defaultBranch;
    })
    cfg;
}
