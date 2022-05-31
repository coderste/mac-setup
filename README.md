# Setting up a Macbook Pro my way

This repo contains the code to set-up a brand new Macbook Pro with all the apps and tools I use on a day-to-day basis while working.

The `initial-setup.sh` does about 90% of the work. The rest of the work requires entering licensing keys for things like `Alfred` and possibly some themes for VS Code, along with logging into the various apps downloaded like `Slack`, `Discord` etc.

All the apps and tools are installed using [Homebrew](https://brew.sh/) so this is the first thing installed in the set-up script.

`apps.txt` and `tools.txt` are pretty self-explanatory in that the `app.txt` will install the macOS Applications using Homebrew flag `--cask` and the `tools.txt` will install just normal terminal tools wthout the `--cask` flag.

The format is as follows
```
NAME FOR THE TEMRINAL=homebrew install name
```

### GitHub CLI and more

For us to be able to download the `zsh` plugins without manually doing so we have to authenticate with the `GitHub CLI` we downloaded as part of the homebrew install. 

Once this is installed we run the authenticate command to authenticate with GitHub and add a newly generate SSH key to our GitHub account. This will allow us to download the submodules within the repo which can then be copied over to the `oh-my-zsh/custom/plugins` directory
