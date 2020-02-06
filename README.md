# appium_flutter_UIautomation

Appium Flutter Driver is a test automation tool for Flutter apps on multiple platforms/OSes. Appium Flutter Driver is part of the Appium mobile test automation tool.

⚠️ pre-0.1.x version
This package is in early stage of exprienment, breaking changes and breaking codes are to be expected! All contributions, including non-code, are welcome! See TODO list below.

Flutter Driver vs Appium Flutter Driver
Even though Flutter comes with superb integration test support, Flutter Driver, it does not fit some specific use cases, such as

writing test in other languages than Dart
running integration test for Flutter app with embedded webview or native view, or existing native app with embedded Flutter view
running test on multiple devices simultanously
running integration test on device farms, such as Saucelabs, AWS, Firebase
Under the hood, Appium Flutter Driver use the Dart VM Service Protocol with extension ext.flutter.driver, similar to Flutter Driver, to control the Flutter app-under-test (AUT).

Installation
In order to use appium-flutter-driver, we need to use a patched version of appium (see PR#12945)

npm i -g appium-flutter-driver git://github.com/truongsinh/appium.git#patch-1

Download the Jar Dependenncy from : 
https://github.com/truongsinh/appium-flutter-driver/releases
