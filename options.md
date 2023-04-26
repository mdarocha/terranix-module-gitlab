# gitlab module options

<ul>
<li>
  <b><u>gitlab.groups</u></b><br>
  <b>type</b>: attribute set of submodules<br>
  <b>default</b>: {}<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/groups.nix">module/groups.nix</a><br>
  <b>description</b>: Definition of a GitLab group<br>
</li>
<li>
  <b><u>gitlab.groups.&lt;name&gt;.description</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/groups.nix">module/groups.nix</a><br>
  <b>description</b>: The description of the group<br>
</li>
<li>
  <b><u>gitlab.groups.&lt;name&gt;.id</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;${gitlab_group.‹name›.id}&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/groups.nix">module/groups.nix</a><br>
  <b>description</b>: Terraform reference to the id of the group.
Used for convienience when referencing the group in other resources.
Should not be overriden, the default value should be fine.
<br>
</li>
<li>
  <b><u>gitlab.groups.&lt;name&gt;.name</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;‹name›&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/groups.nix">module/groups.nix</a><br>
  <b>description</b>: The name of the group<br>
</li>
<li>
  <b><u>gitlab.groups.&lt;name&gt;.parentId</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/groups.nix">module/groups.nix</a><br>
  <b>description</b>: ID of the parent group<br>
</li>
<li>
  <b><u>gitlab.groups.&lt;name&gt;.path</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;‹name›&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/groups.nix">module/groups.nix</a><br>
  <b>description</b>: The path of the group<br>
</li>
<li>
  <b><u>gitlab.groups.&lt;name&gt;.settings</u></b><br>
  <b>type</b>: anything<br>
  <b>default</b>: {}<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/groups.nix">module/groups.nix</a><br>
  <b>description</b>: Any additional settings you may want to set.
See the [gitlab_group resource](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/group)
documentation for a list of possible values.
<br>
</li>
<li>
  <b><u>gitlab.projects</u></b><br>
  <b>type</b>: attribute set of submodules<br>
  <b>default</b>: {}<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/projects.nix">module/projects.nix</a><br>
  <b>description</b>: Definition of a GitLab project<br>
</li>
<li>
  <b><u>gitlab.projects.&lt;name&gt;.defaultBranch</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;main&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/projects.nix">module/projects.nix</a><br>
  <b>description</b>: Name of the default branch<br>
</li>
<li>
  <b><u>gitlab.projects.&lt;name&gt;.description</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/projects.nix">module/projects.nix</a><br>
  <b>description</b>: Description of the project<br>
</li>
<li>
  <b><u>gitlab.projects.&lt;name&gt;.id</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;${gitlab_project.‹name›.id}&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/projects.nix">module/projects.nix</a><br>
  <b>description</b>: Terraform reference to the id of the group.
Used for convienience when referencing the group in other resources.
Should not be overriden, the default value should be fine.
<br>
</li>
<li>
  <b><u>gitlab.projects.&lt;name&gt;.name</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;‹name›&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/projects.nix">module/projects.nix</a><br>
  <b>description</b>: Name of the project<br>
</li>
<li>
  <b><u>gitlab.projects.&lt;name&gt;.namespaceId</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/projects.nix">module/projects.nix</a><br>
  <b>description</b>: ID of the namespace (user or group) this project should be in.<br>
</li>
<li>
  <b><u>gitlab.projects.&lt;name&gt;.settings</u></b><br>
  <b>type</b>: anything<br>
  <b>default</b>: {}<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/projects.nix">module/projects.nix</a><br>
  <b>description</b>: Any additional settings you may want to set.
See the [gitlab_project resource](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project)
documentation for a list of possible values.
<br>
</li>
<li>
  <b><u>gitlab.provider.enable</u></b><br>
  <b>type</b>: boolean<br>
  <b>default</b>: false<br>
  <b>example</b>: true<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/provider.nix">module/provider.nix</a><br>
  <b>description</b>: Whether to enable GitLab provider.<br>
</li>
<li>
  <b><u>gitlab.rootGroup.groupId</u></b><br>
  <b>type</b>: null or signed integer<br>
  <b>default</b>: null<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/root_group.nix">module/root_group.nix</a><br>
  <b>description</b>: ID of the root group.
<br>
</li>
<li>
  <b><u>gitlab.rootGroup.id</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;${data.gitlab_group.root.id}&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/root_group.nix">module/root_group.nix</a><br>
  <b>description</b>: Terraform reference to the id of the group.
Used for convienience when referencing the group in other resources.
Should not be overriden, the default value should be fine.
<br>
</li>
<li>
  <b><u>gitlab.users</u></b><br>
  <b>type</b>: attribute set of submodules<br>
  <b>default</b>: {}<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/users.nix">module/users.nix</a><br>
  <b>description</b>: Creates data objects for the given users.
You can then get a terraform reference to the id of that user
(for use in group or project options) using the .id option.
<br>
</li>
<li>
  <b><u>gitlab.users.&lt;name&gt;.id</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;${data.gitlab_user.‹name›.id}&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/users.nix">module/users.nix</a><br>
  <b>description</b>: Terraform reference to the id of the user.
Used for convienience when referencing the user in other resources.
Should not be overriden, the default value should be fine.
<br>
</li>
<li>
  <b><u>gitlab.users.&lt;name&gt;.username</u></b><br>
  <b>type</b>: string<br>
  <b>default</b>: &#34;‹name›&#34;<br>
  <b>example</b>: null<br>
  <b>defined</b>: <a href="https://github.com/mdarocha/terranix-module-gitlab/tree/main/module/module/users.nix">module/users.nix</a><br>
  <b>description</b>: Username of the given user<br>
</li>
</ul>
