// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dog _$DogFromJson(Map<String, dynamic> json) {
  return _Dog.fromJson(json);
}

/// @nodoc
class _$DogTearOff {
  const _$DogTearOff();

  _Dog call({required int fileSizeBytes, required String url}) {
    return _Dog(
      fileSizeBytes: fileSizeBytes,
      url: url,
    );
  }

  Dog fromJson(Map<String, Object?> json) {
    return Dog.fromJson(json);
  }
}

/// @nodoc
const $Dog = _$DogTearOff();

/// @nodoc
mixin _$Dog {
  int get fileSizeBytes => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DogCopyWith<Dog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DogCopyWith<$Res> {
  factory $DogCopyWith(Dog value, $Res Function(Dog) then) =
      _$DogCopyWithImpl<$Res>;
  $Res call({int fileSizeBytes, String url});
}

/// @nodoc
class _$DogCopyWithImpl<$Res> implements $DogCopyWith<$Res> {
  _$DogCopyWithImpl(this._value, this._then);

  final Dog _value;
  // ignore: unused_field
  final $Res Function(Dog) _then;

  @override
  $Res call({
    Object? fileSizeBytes = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      fileSizeBytes: fileSizeBytes == freezed
          ? _value.fileSizeBytes
          : fileSizeBytes // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DogCopyWith<$Res> implements $DogCopyWith<$Res> {
  factory _$DogCopyWith(_Dog value, $Res Function(_Dog) then) =
      __$DogCopyWithImpl<$Res>;
  @override
  $Res call({int fileSizeBytes, String url});
}

/// @nodoc
class __$DogCopyWithImpl<$Res> extends _$DogCopyWithImpl<$Res>
    implements _$DogCopyWith<$Res> {
  __$DogCopyWithImpl(_Dog _value, $Res Function(_Dog) _then)
      : super(_value, (v) => _then(v as _Dog));

  @override
  _Dog get _value => super._value as _Dog;

  @override
  $Res call({
    Object? fileSizeBytes = freezed,
    Object? url = freezed,
  }) {
    return _then(_Dog(
      fileSizeBytes: fileSizeBytes == freezed
          ? _value.fileSizeBytes
          : fileSizeBytes // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dog implements _Dog {
  _$_Dog({required this.fileSizeBytes, required this.url});

  factory _$_Dog.fromJson(Map<String, dynamic> json) => _$$_DogFromJson(json);

  @override
  final int fileSizeBytes;
  @override
  final String url;

  @override
  String toString() {
    return 'Dog(fileSizeBytes: $fileSizeBytes, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Dog &&
            const DeepCollectionEquality()
                .equals(other.fileSizeBytes, fileSizeBytes) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fileSizeBytes),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$DogCopyWith<_Dog> get copyWith =>
      __$DogCopyWithImpl<_Dog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DogToJson(this);
  }
}

abstract class _Dog implements Dog {
  factory _Dog({required int fileSizeBytes, required String url}) = _$_Dog;

  factory _Dog.fromJson(Map<String, dynamic> json) = _$_Dog.fromJson;

  @override
  int get fileSizeBytes;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$DogCopyWith<_Dog> get copyWith => throw _privateConstructorUsedError;
}
