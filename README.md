# EnvironmentsDemo

An example Xcode project with schemes for different build environments. The schemes automatically reconfigure the project for each environment. The project demonstrates how to set up hierarchies of parameters in a flexible and optimal way, to account for different scenarios.

![Screenshot](https://raw.githubusercontent.com/kimsand/EnvironmentsDemo/master/images/XcodeEnvSchemes.png)

## Rationale
As a project grows it becomes necessary to build different versions of the app for different environments, e.g. for development, preproduction, production and release. These builds need separate configurations like URLs, keys and active/inactive features.

Team members also appreciate the ability to have multiple versions installed simultaneously without having to reinstall the app when switching environment. This requires separate bundle IDs and bundle names.

Some projects are also handed off to a different team for signing and submission to the App Store, and they need a way to automatically pick the right configuration.

Having to manually reconfigure the project each time the build targets a different environment, or is handed to another team, quickly becomes tedious, inefficient and error prone. Not to mention the code versioning history jumping between configurations depending on the active environment at check-in.

What is needed is a way to set up multiple, simultaneous configurations and a way to switch automatically between these as needed.

## Build targets
In Xcode it is not intuitive how to configure a project in this manner. The most obvious approach is to add separate build targets, but these essentially become duplicate copies of lots of parameters. The vast majority of these parameters are shared and need to stay the same. Each parameter change must therefore be updated multiple places, which again is tedious and error prone.

Clearly, using build targets is not the optimal solution in this case. Ideally only the parameters which actually differ between environments should be dealt with.

And it would be preferable to just update a configuration file without having to click around inside the Xcode build settings editor.

## Schemes
Instead, Xcode has a separate concept called schemes, which better matches the described scenario. Using separate schemes, the different app versions can share the same target but switch out a couple of parameters as needed.

However, these parameters need to be accessible from code. And their values should update automatically per environment, without needing additional code to check for and replace them.

## xcconfig files
As it turns out, using schemes in combination with preprocessor macros backed by xcconfig files fits all these requirements. This is not straightforward to set up the first time, hence this example project which shows how it is done.

The xcconfig files have the additional benefit of being able to include each other, so a set of parameters can be shared between multiple environments. E.g. if development and production use different URLs but the same tracking key, which is separate from the key used in release. Many scenarios become possible.

## A note on Swift
Unlike in Objective-C, Swift can not access preprocessor macros directly, so a header file (.h) and a bridging header is necessary to make this work for the time being.