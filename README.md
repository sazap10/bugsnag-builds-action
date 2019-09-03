# Bugsnag build reporting action
GitHub Action for reporting builds to Bugsnag using the Build API. This action will use the Github tag for the version by default. For more information about the Build API, see [here](https://docs.bugsnag.com/api/build/)

## Usage
```
on:
  push:
    tags:
      - '*'
...
    - name: Report build to bugsnag
      uses: sazap10/bugsnag-builds-action@master
      env:
        BUGSNAG_API_KEY: ${{ secrets.BUGSNAG_API_KEY }}
```

## Usage for HCL syntax
```
action "Filter tag" {
  uses = "actions/bin/filter@master"
  args = "tag"
}
action "Report build" {
  needs = "Filter tag"
  uses = "sazap10/bugsnag-builds-action@master"
  secrets = ["BUGSNAG_API_KEY"]
}
```

### Secrets
* `BUGSNAG_API_KEY` **Required** - The notifier API key of the project.

### Environment variables
* `BUILD_API_URL` *(optional)* - Overrides the default build API url. Defaults to `https://build.bugsnag.com`
* `RELEASE_STAGE` *(optional)* - Overrides the default release stage. Defaults to `production`
* `BUILDER_NAME` *(optional)* - Overrides the default builder name. Defaults to `Bugsnag build reporting`
* `METADATA` *(optional)* - Overrides the default metadata. This should be valid JSON. Defaults to `{}`.
* `AUTO_ASSIGN_RELEASE` *(optional)* - Flag indicating whether to automatically associate this build with any new error events and sessions that are received for the release stage until a subsequent build notification is received for the release stage. Defaults to `false`
* `VERSION` *(optional)* - Overrides the default reported app version. Defaults to the Github tag.

## License
The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
