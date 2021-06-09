## 1.0.0+1
* Added total switches support:
    - parameter:
        - totalSwitches (required, type int)
* Labels parameter is now optional.
* Added border color and border width support: 
    - parameters:
        - borderColor (optional, type List<Color> for gradient colors support)
        - borderWidth (optional, type double)
* Added divider color support:
    - dividerColor (optional, type Color)
* Added gradient colors support for active backgrounds:
    - activeBgColor and activeBgColors now take an array of Color instead of just Color (check examples)
    - parameters:
        - activeBgColor (optional, type List<Color>)
        - activeBgColors (optional, type List<List<Color>>)
* Added animation support:
    - parameters:
        - animate (optional, type bool):
            - with just animate set to true, default curve = Curves.easeIn
        - curve (optional, type Curve):
            - animate must be set to true when using custom curve
* Added new active switch style based on corner radius:
    - parameter:
        - radiusStyle (optional, type bool)

## 0.1.9
* Upgraded pre 1.12 flutter embedding in Android for example project ([22d04ea](https://github.com/PramodJoshi/toggle_switch/pull/24/commits/22d04ea4b9ffa83a8d0764d2d8a7e45923888b40)).
* Enabled AndroidX support for example project ([3b62b21](https://github.com/PramodJoshi/toggle_switch/pull/24/commits/3b62b217222a8a7d7d243b4ff7211a7867764650)).
* Migrated to strict null safety ([bb24959](https://github.com/PramodJoshi/toggle_switch/pull/24/commits/bb24959b9e95634b411b1159b85eca6fac756db5)).
    
## 0.1.8
* Added left and right padding. 
* Added fixes to prevent overflow:
    - max widget width is calculated based on the number of labels/switches, minWidth and max screen width.
    - resize widgets to fit if user-provided size params exceed available width.

## 0.1.7
* Added fix to programmatically change switch index ([a04d62e](https://github.com/PramodJoshi/toggle_switch/pull/8/commits/a04d62e3c0630785ad2b9dd66b2226a68bed57e2)). 
* Added changeOnTap option to enable/disable switch ([a04d62e](https://github.com/PramodJoshi/toggle_switch/pull/8/commits/a04d62e3c0630785ad2b9dd66b2226a68bed57e2)).

## 0.1.6
* Made color parameters optional. 
* Use default theme color if color parameter is null/not provided.
* Added additional gitignores for package.

## 0.1.5
* Added minHeight, fontSize, iconSize support.
* Added text overflow support.
* Renamed arguments to make them more specific.
* Added usage examples in Readme.

## 0.1.4
* Added icons support.
* Added different active background colors support.

## 0.1.1 ~ 0.1.3
* Readme updates.

## 0.1.0
* First version release.