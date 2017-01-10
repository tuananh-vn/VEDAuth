# VEDAuth

[![CI Status](http://img.shields.io/travis/tuananh/VEDAuth.svg?style=flat)](https://travis-ci.org/tuananh/VEDAuth)
[![Version](https://img.shields.io/cocoapods/v/VEDAuth.svg?style=flat)](http://cocoapods.org/pods/VEDAuth)
[![License](https://img.shields.io/cocoapods/l/VEDAuth.svg?style=flat)](http://cocoapods.org/pods/VEDAuth)
[![Platform](https://img.shields.io/cocoapods/p/VEDAuth.svg?style=flat)](http://cocoapods.org/pods/VEDAuth)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
**`GCVETVHelpManager`** - a `Singleton` that support a float button.

**Init Singleton:**
```objective-c
GCVETVHelpManager *floatManager = [GCVETVHelpManager sharedManager];
```

**Init Singleton with frame:**
```objective-c
GCVETVHelpManager *floatManager = [GCVETVHelpManager sharedManagerWithFrame:CGRectMake(100, 100, 50, 50)];
```
**Set appid, access_token, serverurl, :**
```objective-c
    floatManager.appid = @"";
    floatManager.tokenID = @"";
    floatManager.serverURL = @"";
    floatManager.extraData = [[NSDictionary alloc] init];
```
**Set custom salt :**
```objective-c
    floatManager.salt = @"";
```
**Set redirect URL :**
```objective-c
    floatManager.redirectURL = @"";
```

**Set float button image:**
```objective-c
    [floatManager setHelpImage:[UIImage imageNamed:@""]];
```


**Show/Hide Float Button:**
```objective-c
    [floatManager showHelp];
    
    [floatManager hideHelp];
```


## Requirements

## Installation

VEDAuth is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "VEDAuth"
```

## Author

tuananh, viking8490@gmail.com

## License

VEDAuth is available under the MIT license. See the LICENSE file for more info.
