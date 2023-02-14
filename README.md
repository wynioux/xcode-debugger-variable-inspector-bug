# xcode-debugger-variable-inspector-bug
Minimal project that showcases a bug in the Xcode Debugger Variable Inspector

# Bug Report

**Description:**

Xcode debugger variable inspector shows objects recursively.

![Bug Screenshot](/Resources/Screenshot.png?raw=true "Bug Screenshot")

As seen in the red area Variable Inspector shows `HTTPBIN.HTTPMethods.Base.ResponseModel` object recursively. But as seen in the green area, object can be accessed as normal. It's only visual bug.

**Steps to reproduce:**

Inherit a class from another class with the same name but under different enum.

Sample project is available at: https://github.com/wynioux/xcode-debugger-variable-inspector-bug

**Environment:**
- Swift Compiler Version: 1.62.15 Apple Swift version 5.7.2 (swiftlang-5.7.2.135.5 clang-1400.0.29.51)
- Xcode Version: 14.2 (14C18)
- Deployment Target: iOS 16.2
