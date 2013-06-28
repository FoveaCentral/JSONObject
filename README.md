
JSONObject
==========
Lightweight JSON marshaling for Objective-C, with Ruby-like string inflections as a bonus.

## Installation

1. Install [CocoaPods](http://docs.cocoapods.org/guides/installing_cocoapods.html).

2. Add the Podfile to your project root:

  ```ruby
  pod 'JSONObject'
  ```
3. In your project root, install the pod by entering:

  ```
  pod install
  ```
4. Open the ```.xcworkspace``` file in your project directory. From now on, use this workspace instead of the ```.xcodeproj``` file.

5. Add JSONObject to your model object's class header:

  ```objective-c
  #import <JSONObject/NSObject+JSONObject.h>
  ```

## Usage

* To convert the model object to JSON wrapped in the key name "object":

  ```objective-c
  NSData *json = [myObject toJSON:@"object"];
  ```

  This JSON data stream is suitable for use in a JSON request.
