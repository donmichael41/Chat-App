# Chat-App
Demo as MVVM + RxSwift

# To run unit test from command line:
+ cd to foder then run the cml bellow.
"xcodebuild test -workspace 'ChatApp.xcworkspace' -scheme 'ChatApp' -destination 'platform=iOS Simulator,name=iPhone 7,OS=10.1'"

# To enable code coverage
+ Edit Scheme, in Test chosse tab Infor. Select Gather coverage data.
+ Run unit from Xcode by Cmd + u, after test finish choose report navigator, chosse lastest test then see the Coverage in the right.

# To run UI test

+ Run unit test as normal
+ After unit test done, notice the device is runnign UI test.
