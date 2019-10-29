# Weblate Concourse Resource

A simple [resource](https://concourse-ci.org/implementing-resource-types.html) for [Concourse CI](https://concourse-ci.org/) to interact with a [Weblate](https://weblate.org/en/) server. It uses the [wlc cli client](https://docs.weblate.org/en/latest/wlc.html) to interact with the Weblate server to perform simple repository commands like _push_, _pull_, _lock_ or _unlock_.

**This is still a work in progress.** Feel free to contribute fixes and more features or open an issue but don't expect immediate support. This resource is not an official project of the Weblate or Concourse team.



## Resource Type Configuration

```
resource_types:
  - name: weblate
    type: registry-image
    source:
      repository: cioplenu/concourse-weblate-resource
      tag: latest
```

The `cioplenu/concourse-weblate-resource` will be rebuild regularly but you are encouraged to build your own image from source if needed.



## Source Configuration

* `url`: _Required_ URL of your weblate API like it's provided to the `wlc` cli tool. Example: `https://translate.myproject.org/api/` . The trailing slash is necessary
* `key`: _Required_ Auth Token for the weblate server. This can be acquired in the admin interface or in the account settings under "API access"
* `translation`: _Required_ Path of a translation, component or project on the weblate server. Usually in the form:`some-project/mobile-app` 



## Behavior

Currently only `out` interacts with the server. Keep in mind that weblate puts a rate limit on wlc requests. If you run into a `Throttling on the server` error limit your requests or consult the weblate docs.

### `out`: Run wlc commands

Runs the provided command against the configured translation on the weblate server. 

**Parameters**:

* `command`: _Required_ Command to run against the weblate server. Currently supported are: `commit`, `pull`, `push`, `reset`, `cleanup`, `lock`, `unlock`

### `check`: No-Op

Check is basically a no-op. It only checks if all required fields in the source configuration are present.

### `in`: No-Op



