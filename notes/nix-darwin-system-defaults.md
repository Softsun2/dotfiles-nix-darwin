# Nix Darwin System Defaults

Declaring system and user MacOS preferences. Preferences are typically set with the MacOS app **System Preferences**. Nix Darwin has options to declare many of these preferences. As much as I am in favor of declaring system defaults it's incredibly tedious as only a subset of the defaults are implemented as Nix Darwin options.

## System Defaults

### Domains and Defaults
A domain is dictionary of keys and values representing its defaults (preferences). Internally XML Property Lists. All applications, system services, and other programs have their own domains, however they share a domain called **NSGlobalDomain**. **NSGlobalDomain** defaults are inherited by application domains if not overwritten.

Not all preference defaults **exist** initially. For some preferences, they have to be set before they are written to a plist. When unset or deleted plists aren't automatically reverted to their default state i.e., removing a default from your Nix Darwin configuration will not revert the default to its default value. To check the state of your declared defaults, especially after changing/unsetting a few, restore all the system defaults **temporarily** with `and then reapplying my Nix Darwin declarations.


## `Defaults`
`Defaults` allows users to read, write, and delete Mac OS X user defaults from a command-line shell. See `man defaults` for more info.

Nix Darwin doesn't support every preference. If a preference cannot be declared with a Nix Darwin option you will have to find the option and set it under either `CustomUserPreferences` or `CustomSystemPreferences`.

Some useful commands for finding typical defaults:

-   If you know keywords related to the preference you can look for the exact defaults using `defaults find yourkeyword`
-   If you know the domain's associated `.plist` file you can read the keys and values with `defaults read /path/to/target.domain.plist`.
-   If you know the domain but not the default associated with a preference you can diff the outputs of reading the domain's defaults before changing the preference and after to locate the target default.

It can be tricky to locate defaults for preferences you wish to set. For instance some defaults can not be located or set by `defaults` the defaults stored in the plist `/Library/Preferences/com.apple.PowerManagement` (power/battery settings) must be set and read by `pmset` (let's integrate these into nix-darwin!). You may have to do some digging to find the defaults you're looking for. [This](https://github.com/gilacost/dot-files/blob/8e568957eb742977ac8410f523b9b25be07d50e4/darwin-configuration.nix) is an example of setting atypical preferences that aren't supported by Nix Darwin options.

[Plistwatch](https://github.com/catilac/plistwatch) is a tool that watches your plists and echos the `default` command equivalent of setting the preference in the GUI. It is very helpful.
