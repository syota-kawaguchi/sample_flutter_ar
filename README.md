# 概要
flutterでARを動かしているプロジェクトです.<br>
<img width="200px" alt="SCR-20230502-nedr" src="https://github.com/syota-kawaguchi/sample_flutter_ar/assets/57338033/b8e7ce84-31cf-4e88-8f26-9619e4f901f5">

# トラブルシューティング
## kotlin Gradle plugin versionでエラーが発生したとき
```
  The Android Gradle plugin supports only Kotlin Gradle plugin version 1.5.20 and higher.
  The following dependencies do not satisfy the required version:
  project ':arcore_flutter_plugin' -> org.jetbrains.kotlin:kotlin-gradle-plugin:1.3.50
```
1. android/build.gradleの`ext.kotlin_version`を確認。1.5.20以下であれば1.5.20以上に修正する。
2. android/build.gradleに特に問題がなければ、プロジェクト直下の`.flutter-plugins`を確認する。
3. `arcore_flutter_plugin`のパスに移動する。
4. `android/build.gradle`の`ext.kotlin_version`を確認し、1.5.20以下であれば1.5.20以上に修正する。

## エミュレーターでうまくARが表示されないとき
1. [こちら](https://developers.google.com/sceneform/develop/emulator?hl=ja)の通りにエミュレーターを設定する。
2. 1を試して動かしてみる
3. 2でうまく動かなかった場合、[リリースノート](https://github.com/google-ar/arcore-android-sdk/releases)から
`Google_Play_Services_for_AR_1.41.0_x86_for_emulator.apk`をダウンロードし、エミュレーターにダウンロードしたファイルをドラッグアンドドロップする。
