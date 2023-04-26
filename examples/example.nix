{ config, ... }:

{
  gitlab.provider.enable = true;

  gitlab.rootGroup.groupId = 123;

  gitlab.users.mdarocha.username = "mdarocha";

  gitlab.groups = {
    example-group = {
      parentId = config.gitlab.rootGroup.id;
    };
  };

  gitlab.projects = {
    group-project = {
      name = "GroupProject";
      description = "A project in a group";
      namespaceId = config.gitlab.groups.example-group.id;
    };

    user-project = {
      description = "A project owned by a user";
      namespaceId = config.gitlab.users.mdarocha.id;
      files.example = {
        filePath = "example.txt";
        content = "Example of a file creation using terraform";
      };
    };
  };
}
