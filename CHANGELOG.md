## 2.2.1
* updated version in README
* updated screenshot

## 2.2.0
* Minor cleanups and fixes
* Example updates
* Added topics, screenshots and funding to pubspec
* Separated RowToColumn widget class
* Updated SDK to 4.0.0, modifier fixes ([PR 83](https://github.com/PramodJoshi/toggle_switch/pull/83/files))
* Added toggle disable functionality ([PR 81](https://github.com/PramodJoshi/toggle_switch/pull/81/files)):
    - parameter:
        - states (optional, type List<bool>)
        
## 2.1.0
* Added cancel toggle function ([PR 77](https://github.com/PramodJoshi/toggle_switch/pull/77/files)):
    - function:
        - cancelToggle: (index) {} (return type - Future\<bool>)
* Added these options [PR 74](https://github.com/PramodJoshi/toggle_switch/pull/74/files)):
    - center text:
        - centerText (optional, type bool - default false)
    - multi-line text:
        - multiLineText (optional, type bool - default false)
    - inherit activeFgColor and inactiveFgColor in customTextStyles
* Null safety improvements ([PR 68](https://github.com/PramodJoshi/toggle_switch/pull/68/files))

## 2.0.1
* Added vertical toggle switch option ([PR 51](https://github.com/PramodJoshi/toggle_switch/pull/51/files)):
    - parameter:
        - isVertical (type bool - default false)
* Added active borders option (Partial implementation from [PR 53](https://github.com/PramodJoshi/toggle_switch/pull/53/files)):
    - parameter:
        - activeBorders (optional, type List\<Border>)
    - list with only one Border value will apply that Border to all the active switches
    - different Border values can be provided for different switches
* Added divider margin option:
    - parameter:
        - dividerMargin (optional, type double - default 8.0)        
* Made totalSwitches parameter optional. 
* Added new changes to customTextStyles:
    - list with only one TextStyle value will apply that TextStyle to all the active switches
* Added new changes to customWidths:
    - customWidths can now reflect widths greater than device width
    - must use horizontal scroll view to prevent overflow
        
## 1.4.0
* Minor bug fix ([PR 44](https://github.com/PramodJoshi/toggle_switch/pull/44)).
    - return null when active switch is de-activated by re-tapping
* Added changes to fix radiusStyle bug when text direction is set to TextDirection.rtl
    - parameter:
        - textDirectionRTL (optional, type bool - default false)
* Added custom widths support
    - parameter:
        - customWidths (optional, type List\<double>)

## 1.3.0
* Added null support for initialLabelIndex ([PR 39](https://github.com/PramodJoshi/toggle_switch/pull/39/commits)).
* Added double tap support to de-select/de-activate active switch ([PR 41](https://github.com/PramodJoshi/toggle_switch/pull/41)):
    - parameter:
        - doubleTapDisable (optional, type bool - default false)
* Added animation duration support:
    - parameter:
        - animationDuration (optional, type int - default 800)
* Added package test
    
## 1.2.0
* Added custom icons support:
    - parameter:
        - customIcons (optional, type List\<Icon>)
    - customIcons will overwrite 'icons:'
    
## 1.1.0
* Added custom text styles support:
    - parameter:
        - customTextStyles (optional, type List\<TextStyle>)
    - text style can now be configured for individual switches
* Added text or icon support:
    - icons parameter now accepts null value (check examples)

## 1.0.0+1
* Added total switches support:
    - parameter:
        - totalSwitches (required, type int)
* Labels parameter is now optional.
* Added border color and border width support: 
    - parameters:
        - borderColor (optional, type List\<Color> for gradient colors support)
        - borderWidth (optional, type double)
* Added divider color support:
    - dividerColor (optional, type Color)
* Added gradient colors support for active backgrounds:
    - activeBgColor and activeBgColors now take an array of Color instead of just Color (check examples)
    - parameters:
        - activeBgColor (optional, type List\<Color>)
        - activeBgColors (optional, type List\<List\<Color>>)
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