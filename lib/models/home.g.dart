// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeCWProxy {
  Home id(String id);

  Home addressNumber(String addressNumber);

  Home haveVisitor(bool haveVisitor);

  Home recentlyUsedScene(Scene? recentlyUsedScene);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Home(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Home(...).copyWith(id: 12, name: "My name")
  /// ````
  Home call({
    String? id,
    String? addressNumber,
    bool? haveVisitor,
    Scene? recentlyUsedScene,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHome.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHome.copyWith.fieldName(...)`
class _$HomeCWProxyImpl implements _$HomeCWProxy {
  const _$HomeCWProxyImpl(this._value);

  final Home _value;

  @override
  Home id(String id) => this(id: id);

  @override
  Home addressNumber(String addressNumber) =>
      this(addressNumber: addressNumber);

  @override
  Home haveVisitor(bool haveVisitor) => this(haveVisitor: haveVisitor);

  @override
  Home recentlyUsedScene(Scene? recentlyUsedScene) =>
      this(recentlyUsedScene: recentlyUsedScene);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Home(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Home(...).copyWith(id: 12, name: "My name")
  /// ````
  Home call({
    Object? id = const $CopyWithPlaceholder(),
    Object? addressNumber = const $CopyWithPlaceholder(),
    Object? haveVisitor = const $CopyWithPlaceholder(),
    Object? recentlyUsedScene = const $CopyWithPlaceholder(),
  }) {
    return Home(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      addressNumber:
          addressNumber == const $CopyWithPlaceholder() || addressNumber == null
              ? _value.addressNumber
              // ignore: cast_nullable_to_non_nullable
              : addressNumber as String,
      haveVisitor:
          haveVisitor == const $CopyWithPlaceholder() || haveVisitor == null
              ? _value.haveVisitor
              // ignore: cast_nullable_to_non_nullable
              : haveVisitor as bool,
      recentlyUsedScene: recentlyUsedScene == const $CopyWithPlaceholder()
          ? _value.recentlyUsedScene
          // ignore: cast_nullable_to_non_nullable
          : recentlyUsedScene as Scene?,
    );
  }
}

extension $HomeCopyWith on Home {
  /// Returns a callable class that can be used as follows: `instanceOfHome.copyWith(...)` or like so:`instanceOfHome.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeCWProxy get copyWith => _$HomeCWProxyImpl(this);
}
