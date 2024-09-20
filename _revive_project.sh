# remove .lock file before getting dependency
# in root folder
rm pubspec.lock
rm -rf build

# inside ios folder
cd ios
rm Podfile.lock
rm .envfile
rm -rf Pods

cd Flutter
rm tmp.xcconfig
cd ..

# do flutter clean and pub get then remove some unused file
flutter clean
flutter pub get

# do pod install and get back to root folfer
pod deintegrate
pod install
pod repo update
cd ..

rm .flutter-plugins
rm .flutter-plugins-dependencies

# fix bad code
dart fix --apply