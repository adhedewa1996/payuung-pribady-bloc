-keep class com.example.example.staging.BuildConfig { *; }
-keep class com.example.example.development.BuildConfig { *; }
-keep class com.example.example.BuildConfig { *; }
-keep class com.byneapp.flutter_config.FlutterConfigPlugin { *; }
-keep class androidx.lifecycle.DefaultLifecycleObserver

##Flutter Wrapper
#-keep class io.flutter.app.** { *; }
#-keep class io.flutter.plugin.**  { *; }
#-keep class io.flutter.util.**  { *; }
#-keep class io.flutter.view.**  { *; }
#-keep class io.flutter.**  { *; }
#-keep class io.flutter.plugins.**  { *; }
#
#-keep class com.google.firebase.** { *; }
#-keep class com.google.android.**