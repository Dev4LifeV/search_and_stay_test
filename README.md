<h1>Search and Stay Test</h1>

This is a CRUD app that manage house rules.

Looks like a simple CRUD app, but it is not.

This application was built using Flutter/Dart, Android/Kotlin and iOS/Swift. Every API handling (except Google authentication) is being managed by its respective native side (Swift, in case of iOS, and Kotlin in case of Android).

Thanks to Flutter MethodChannels (to get acquainted of more details, visit <a href=https://docs.flutter.dev/development/platform-integration/platform-channels>Writing custom platform-specific code</a>), Flutter can communicate to the native sides to send and receive data through separate channels. That means you can have different channels for different API handling (e.g. one for biometrics, one for camera, etc). 

The motivation to build this application is to showcase Flutter working with native APIs through MethodChannels and demonstrate the articulation of my skills within the framework.

<h1>Getting started</h1>

- To test in iOS devices, check if you are using a MacOS system to build and run the app properly.

- Look if you have an Integrated Development Environment with Flutter enabled (IDE; Visual Studio Code, Android Studio, etc) installed properly on your machine.

- Open a terminal and run <code>git -v</code> to look for Git is set up.

- On the same terminal, run <code>flutter doctor</code> to see whether Flutter is installed and configured accordingly in your system. If not, you can follow the step-by-step documentation <a href="https://docs.flutter.dev/get-started">here</a>.

- Clone the repository through CLI (<code>git clone https://github.com/Dev4LifeV/search_and_stay_test</code>) or through <a href="x-github-client://openRepo/https://github.com/Dev4LifeV/search_and_stay_test">GitHub Desktop</a> and place in your favorite directory.

- Open your IDE and locate for the project folder.

- Then start the project by selecting in which system (iOS or Android device) do you want to build and run through your IDE.
