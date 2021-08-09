# Error using structs in a View loaded by Interface Builder with a swiftinterface module

This repo describes an error of Interface Builder in iOS 12 and previous versions.

To reproduce this error, you need to:

- Create a dynamic framework, add a struct, and change the Build for Distribution to YES.
- Import that framework to your app's project.
- Create a custom view xib, and add it to another xib or storyboard.
- In the custom view class, add the struct created in the previous framework.
- Run your code in a iOS 12 device or simulator.

You will see an error like this in lldb:

[IMAGE 1]

If you try to get the class using objc runtime, the both scenarios may happen:

⛈ iOS 12:

[IMAGE 2]

🌞 iOS 13:

[IMAGE 3]