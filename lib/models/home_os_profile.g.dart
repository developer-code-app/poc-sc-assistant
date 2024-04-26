// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_os_profile.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeOSProfileCWProxy {
  HomeOSProfile home(Home home);

  HomeOSProfile scenes(List<Scene> scenes);

  HomeOSProfile haveVisitor(bool haveVisitor);

  HomeOSProfile recentlyUsedSceneId(String recentlyUsedSceneId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeOSProfile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeOSProfile(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeOSProfile call({
    Home? home,
    List<Scene>? scenes,
    bool? haveVisitor,
    String? recentlyUsedSceneId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeOSProfile.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomeOSProfile.copyWith.fieldName(...)`
class _$HomeOSProfileCWProxyImpl implements _$HomeOSProfileCWProxy {
  const _$HomeOSProfileCWProxyImpl(this._value);

  final HomeOSProfile _value;

  @override
  HomeOSProfile home(Home home) => this(home: home);

  @override
  HomeOSProfile scenes(List<Scene> scenes) => this(scenes: scenes);

  @override
  HomeOSProfile haveVisitor(bool haveVisitor) => this(haveVisitor: haveVisitor);

  @override
  HomeOSProfile recentlyUsedSceneId(String recentlyUsedSceneId) =>
      this(recentlyUsedSceneId: recentlyUsedSceneId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeOSProfile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeOSProfile(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeOSProfile call({
    Object? home = const $CopyWithPlaceholder(),
    Object? scenes = const $CopyWithPlaceholder(),
    Object? haveVisitor = const $CopyWithPlaceholder(),
    Object? recentlyUsedSceneId = const $CopyWithPlaceholder(),
  }) {
    return HomeOSProfile(
      home: home == const $CopyWithPlaceholder() || home == null
          ? _value.home
          // ignore: cast_nullable_to_non_nullable
          : home as Home,
      scenes: scenes == const $CopyWithPlaceholder() || scenes == null
          ? _value.scenes
          // ignore: cast_nullable_to_non_nullable
          : scenes as List<Scene>,
      haveVisitor:
          haveVisitor == const $CopyWithPlaceholder() || haveVisitor == null
              ? _value.haveVisitor
              // ignore: cast_nullable_to_non_nullable
              : haveVisitor as bool,
      recentlyUsedSceneId:
          recentlyUsedSceneId == const $CopyWithPlaceholder() ||
                  recentlyUsedSceneId == null
              ? _value.recentlyUsedSceneId
              // ignore: cast_nullable_to_non_nullable
              : recentlyUsedSceneId as String,
    );
  }
}

extension $HomeOSProfileCopyWith on HomeOSProfile {
  /// Returns a callable class that can be used as follows: `instanceOfHomeOSProfile.copyWith(...)` or like so:`instanceOfHomeOSProfile.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeOSProfileCWProxy get copyWith => _$HomeOSProfileCWProxyImpl(this);
}
