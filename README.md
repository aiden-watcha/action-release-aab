# action-release-aab

🕷 Build and release release .aab when your push a new tag

## Usage

To use the action simply add the following lines to your `.github/workflows/android.yml` and provide the required Secrets and Environment variables.

#### YML
```
name: Build & Publish Release AAB

on:
  push:
    tags:
      - '*'

jobs:
  Gradle:
    runs-on: ubuntu-latest
    steps:
    - name: checkout code
      uses: actions/checkout@v2
      
    - name: setup jdk
      uses: actions/setup-java@v1
      with:
        java-version: 11
        
    - name: Make Gradle executable
      run: chmod +x ./gradlew
      
    - name: Build Release AAB
      run: ./gradlew bundleRelease
      
    - name: Releasing using Hub
      uses: aiden-watch/action-release-aab@master
      env:
       GITHUB_TOKEN: ${{ secrets.TOKEN }}
       RELEASE_FILE_FOLDER: app/build/outputs/bundle/release
```

### Secrets

You'll need to provide this secret token to use the action (for publishing the aab). Enter these secrets in your Settings > Secrets

* **TOKEN**: Create a new [access token](https://github.com/settings/tokens) with `repo` access.

I am unsure as to why using the default `GITHUB_TOKEN` provided universally will fail to authorize the user. This is the only workaround that I'd found.

### Environment Variables

You'll need to provide these environment variables to specify exactly what information is needed to build the AAB.

* **APP_FOLDER**: main folder to search for the aab. Most of the time, it's `app`

## Credits

Based off [ShaunLWM/action-release-debugapk](https://github.com/ShaunLWM/action-release-debugapk)
