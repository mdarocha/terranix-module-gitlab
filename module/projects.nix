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
        fileCreator = {
          name = mkOption {
            default = "terraform";
            type = str;
            description = "Name of the user that will be visible in commits used to update repository files";
          };
          email = mkOption {
            default = "";
            type = str;
            description = "Email of the user that will be visible in commits used to update repository files";
          };
        };
        files = mkOption {
          default = { };
          description = "Manage files that should be present in the repository";
          type = attrsOf (submodule ({ name, ... }: {
            options = {
              filePath = mkOption {
                type = str;
                description = "Path of the created file inside the repository";
              };
              content = mkOption {
                type = str;
                description = "Content of the file";
              };
            };
          }));
        };
        settings = mkOption {
          default = { };
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

  config.resource."gitlab_repository_file" =
    let
      projectFiles = projectName: project: map
        (name:
          let
            value = getAttr name project.files;
          in
          {
            name = "${projectName}-${name}";
            value = {
              project = project.id;
              branch = project.defaultBranch;
              author_name = project.fileCreator.name;
              author_email = project.fileCreator.email;

              file_path = value.filePath;
              content = value.content;
            };
          })
        (attrNames project.files);
    in
    listToAttrs (flatten (map
      (projectName: (projectFiles projectName (getAttr projectName cfg)))
      (attrNames cfg)
    ));
}
