https://user-images.githubusercontent.com/59589002/235559713-8456b1a1-ad74-4554-84a7-3a54e8dcbf63.mp4

<h1>Search and Stay Test</h1>

This is a CRUD app that manage house rules.

Looks like a simple CRUD app, but it is not.

This application was built using Flutter/Dart, Android/Kotlin, and iOS/Swift. Except for Google authentication, every API handling is managed by its respective native side (Swift for iOS and Kotlin for Android).

Thanks to Flutter MethodChannels (to learn more, visit <a href=https://docs.flutter.dev/development/platform-integration/platform-channels>Writing custom platform-specific code</a>), Flutter can communicate with the native sides to send and receive data through separate channels. This means that you can have different channels for different API handling (e.g., one for biometrics, one for the camera, etc.).

The motivation for building this application is to showcase Flutter's ability to work with native APIs through MethodChannels and demonstrate my skills within the framework.

<h1>Getting started</h1>

- To test on iOS devices, ensure that you are using a macOS system to build and run the app properly.

- Check if you have an Integrated Development Environment with Flutter enabled (such as Visual Studio Code, Android Studio, etc.) installed properly on your machine.

- Open a terminal and run <code>git -v</code> to check if Git is set up.

- On the same terminal, run <code>flutter doctor</code> to see whether Flutter is installed and configured properly on your system. If not, you can follow the step-by-step documentation <a href="https://docs.flutter.dev/get-started">here</a>.

- Clone the repository through the CLI (<code>git clone https://github.com/Dev4LifeV/search_and_stay_test</code>) or through <a href="x-github-client://openRepo/https://github.com/Dev4LifeV/search_and_stay_test">GitHub Desktop</a> and place it in your favorite directory.

- Open your IDE and locate the project folder.

- Then, start the project by selecting which system (iOS or Android device) you want to build and run through your IDE.
