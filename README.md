<img src="cover.png" alt="Ayu Light/Mirage: an _elegant_ theme **paired** with Lora, Fira Code, and Iosevka Curly" width="256"/>

Ayu Obsidian is an [Ayu](https://github.com/ayu-theme) adaptation for [Obsidian](https://obsidian.md/) paired with a font selection.

<a href="https://www.buymeacoffee.com/taronull">
	<img src="https://img.buymeacoffee.com/button-api/?button_colour=242936&coffee_colour=FFD173&outline_colour=CCCAC2&font_colour=D5FF80" />
</a>

# Installation

1. [Download Obsidian](https://obsidian.md/download)
	- `brew install obsidian`
2. Open **Preferences** in Obsidian
	- Menu bar -> Obsidian -> Preferences...
	- `⌘` + `,`
3. Navigate to **Options**-**Appearance**
4. Find **Themes** section and click _Manage_
5. Filter for ***Ayu Light & Mirage***
6. Click _Install and use_

Or, manually download this repo in your `.obsidian/themes`


# Ayu

Colours are applied based on Obsidian semantics and appearance on code editors. Headings and indicators have warmer colours, while body emphasis are cooler.

This theme uses **Ayu Light** and **Ayu Mirage**. But you also have **Ayu Dark** in `theme.css` in case you want it. Simply remove Mirage to apply.

```diff
  .theme-dark {
    /*
    Ayu Dark in RGBa
    */
    ...
  }

- .theme-dark {
-   /*
-   Ayu Mirage in RGBa
-   */
-   ...
- }
```

This adaptation is based on [Ayu Colors](https://github.com/ayu-theme/ayu-colors). The original theme is by [Ike](https://dempfi.com/).

# Fonts

- [Lora](http://cyreal.org/fonts/lora/) by [Cyreal](http://cyreal.org/)
- [Fira Code](https://firacode.org/) by [Niki](https://tonsky.me/)
- [Iosevka Curly](https://typeof.net/Iosevka/) by [Renzhi Li](https://typeof.net/)
  - WOFF2 version from [Fontsource](https://fontsource.org/fonts/iosevka-curly)

# Versioning

1. Update `version` in `package.json` and `manifest.json`
2. Update `minAppVersion` in `manifest.json`
3. Add `<version>: <minAppVersion>` in `versions.json`
4. Add a `git tag -a <version> -m "<version>"`
5. `git push origin <version>` and hope for the best
