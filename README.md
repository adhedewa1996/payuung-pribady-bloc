# IMAGE-TO-RESULT CALCULATOR

### Project ini dibangun menggunakan

Flutter SDK 3.19.6
Dart SDK 3.3.4.

* so makesure flutter version sebelum running code! agar tidak error.

### Documentation

* [Flutter](https://docs.flutter.dev/)
* [Bloc](https://bloclibrary.dev/)
* [VScode](https://code.visualstudio.com/docs)

### Sebelum mulai, mari Set-Up tools / install dibawah

* **pub get** : jangan lupa selalu intall depencendy di pubspec.yaml
* **VScode**

### Project Tree

```editorconfig
├── app
│   ├── bloc
│   ├── commons
│   │   ├── extentions
│   │   ├── models
│   │   ├── repo
│   │   ├── services
│   │   └── widgets
│   ├── page
│   │   └── home
│   ├── routing
│   │   └── route.dart
├── main.dart
```

### How to Run With Flavor In VSCode

* Windows : CTRL + LEFT SHIFT + D .. lalu pilih flavor
* Mac     : COMMAND + LEFT SHIFT + D .. lalu pilih flavor

* Flavor available:
  * GreenCameraRoll
  * GreenFileSystem
  * RedBuildInCamera
  * RedCameraRoll

* Developer note:
  flavor ios, jika dicek bundler indetifier .. untuk flavor diatas .. akan bundler-nya akan sama semua .. karena saat build phase .. akan me-replace tmp.xconfig dengan flavor yang dipilih.
