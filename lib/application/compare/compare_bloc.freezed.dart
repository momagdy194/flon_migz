// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compare_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CompareEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchActiveParcel,
    required TResult Function(List<ProductData> products) setExtraGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveParcel,
    TResult? Function(List<ProductData> products)? setExtraGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveParcel,
    TResult Function(List<ProductData> products)? setExtraGroup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchActiveParcel value) fetchActiveParcel,
    required TResult Function(SetExtraGroup value) setExtraGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchActiveParcel value)? fetchActiveParcel,
    TResult? Function(SetExtraGroup value)? setExtraGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchActiveParcel value)? fetchActiveParcel,
    TResult Function(SetExtraGroup value)? setExtraGroup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompareEventCopyWith<$Res> {
  factory $CompareEventCopyWith(
          CompareEvent value, $Res Function(CompareEvent) then) =
      _$CompareEventCopyWithImpl<$Res, CompareEvent>;
}

/// @nodoc
class _$CompareEventCopyWithImpl<$Res, $Val extends CompareEvent>
    implements $CompareEventCopyWith<$Res> {
  _$CompareEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchActiveParcelCopyWith<$Res> {
  factory _$$FetchActiveParcelCopyWith(
          _$FetchActiveParcel value, $Res Function(_$FetchActiveParcel) then) =
      __$$FetchActiveParcelCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {BuildContext context, bool? isRefresh, RefreshController? controller});
}

/// @nodoc
class __$$FetchActiveParcelCopyWithImpl<$Res>
    extends _$CompareEventCopyWithImpl<$Res, _$FetchActiveParcel>
    implements _$$FetchActiveParcelCopyWith<$Res> {
  __$$FetchActiveParcelCopyWithImpl(
      _$FetchActiveParcel _value, $Res Function(_$FetchActiveParcel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? isRefresh = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FetchActiveParcel(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      isRefresh: freezed == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool?,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as RefreshController?,
    ));
  }
}

/// @nodoc

class _$FetchActiveParcel implements FetchActiveParcel {
  const _$FetchActiveParcel(
      {required this.context, this.isRefresh, this.controller});

  @override
  final BuildContext context;
  @override
  final bool? isRefresh;
  @override
  final RefreshController? controller;

  @override
  String toString() {
    return 'CompareEvent.fetchActiveParcel(context: $context, isRefresh: $isRefresh, controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchActiveParcel &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, isRefresh, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchActiveParcelCopyWith<_$FetchActiveParcel> get copyWith =>
      __$$FetchActiveParcelCopyWithImpl<_$FetchActiveParcel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchActiveParcel,
    required TResult Function(List<ProductData> products) setExtraGroup,
  }) {
    return fetchActiveParcel(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveParcel,
    TResult? Function(List<ProductData> products)? setExtraGroup,
  }) {
    return fetchActiveParcel?.call(context, isRefresh, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveParcel,
    TResult Function(List<ProductData> products)? setExtraGroup,
    required TResult orElse(),
  }) {
    if (fetchActiveParcel != null) {
      return fetchActiveParcel(context, isRefresh, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchActiveParcel value) fetchActiveParcel,
    required TResult Function(SetExtraGroup value) setExtraGroup,
  }) {
    return fetchActiveParcel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchActiveParcel value)? fetchActiveParcel,
    TResult? Function(SetExtraGroup value)? setExtraGroup,
  }) {
    return fetchActiveParcel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchActiveParcel value)? fetchActiveParcel,
    TResult Function(SetExtraGroup value)? setExtraGroup,
    required TResult orElse(),
  }) {
    if (fetchActiveParcel != null) {
      return fetchActiveParcel(this);
    }
    return orElse();
  }
}

abstract class FetchActiveParcel implements CompareEvent {
  const factory FetchActiveParcel(
      {required final BuildContext context,
      final bool? isRefresh,
      final RefreshController? controller}) = _$FetchActiveParcel;

  BuildContext get context;
  bool? get isRefresh;
  RefreshController? get controller;
  @JsonKey(ignore: true)
  _$$FetchActiveParcelCopyWith<_$FetchActiveParcel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetExtraGroupCopyWith<$Res> {
  factory _$$SetExtraGroupCopyWith(
          _$SetExtraGroup value, $Res Function(_$SetExtraGroup) then) =
      __$$SetExtraGroupCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductData> products});
}

/// @nodoc
class __$$SetExtraGroupCopyWithImpl<$Res>
    extends _$CompareEventCopyWithImpl<$Res, _$SetExtraGroup>
    implements _$$SetExtraGroupCopyWith<$Res> {
  __$$SetExtraGroupCopyWithImpl(
      _$SetExtraGroup _value, $Res Function(_$SetExtraGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$SetExtraGroup(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ));
  }
}

/// @nodoc

class _$SetExtraGroup implements SetExtraGroup {
  const _$SetExtraGroup({required final List<ProductData> products})
      : _products = products;

  final List<ProductData> _products;
  @override
  List<ProductData> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'CompareEvent.setExtraGroup(products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetExtraGroup &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetExtraGroupCopyWith<_$SetExtraGroup> get copyWith =>
      __$$SetExtraGroupCopyWithImpl<_$SetExtraGroup>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)
        fetchActiveParcel,
    required TResult Function(List<ProductData> products) setExtraGroup,
  }) {
    return setExtraGroup(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveParcel,
    TResult? Function(List<ProductData> products)? setExtraGroup,
  }) {
    return setExtraGroup?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext context, bool? isRefresh,
            RefreshController? controller)?
        fetchActiveParcel,
    TResult Function(List<ProductData> products)? setExtraGroup,
    required TResult orElse(),
  }) {
    if (setExtraGroup != null) {
      return setExtraGroup(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchActiveParcel value) fetchActiveParcel,
    required TResult Function(SetExtraGroup value) setExtraGroup,
  }) {
    return setExtraGroup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchActiveParcel value)? fetchActiveParcel,
    TResult? Function(SetExtraGroup value)? setExtraGroup,
  }) {
    return setExtraGroup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchActiveParcel value)? fetchActiveParcel,
    TResult Function(SetExtraGroup value)? setExtraGroup,
    required TResult orElse(),
  }) {
    if (setExtraGroup != null) {
      return setExtraGroup(this);
    }
    return orElse();
  }
}

abstract class SetExtraGroup implements CompareEvent {
  const factory SetExtraGroup({required final List<ProductData> products}) =
      _$SetExtraGroup;

  List<ProductData> get products;
  @JsonKey(ignore: true)
  _$$SetExtraGroupCopyWith<_$SetExtraGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CompareState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<List<ProductData>> get compare => throw _privateConstructorUsedError;
  List<GroupProperties> get extraGroup => throw _privateConstructorUsedError;
  List<GroupProperties> get propertyGroup => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompareStateCopyWith<CompareState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompareStateCopyWith<$Res> {
  factory $CompareStateCopyWith(
          CompareState value, $Res Function(CompareState) then) =
      _$CompareStateCopyWithImpl<$Res, CompareState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<List<ProductData>> compare,
      List<GroupProperties> extraGroup,
      List<GroupProperties> propertyGroup});
}

/// @nodoc
class _$CompareStateCopyWithImpl<$Res, $Val extends CompareState>
    implements $CompareStateCopyWith<$Res> {
  _$CompareStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? compare = null,
    Object? extraGroup = null,
    Object? propertyGroup = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      compare: null == compare
          ? _value.compare
          : compare // ignore: cast_nullable_to_non_nullable
              as List<List<ProductData>>,
      extraGroup: null == extraGroup
          ? _value.extraGroup
          : extraGroup // ignore: cast_nullable_to_non_nullable
              as List<GroupProperties>,
      propertyGroup: null == propertyGroup
          ? _value.propertyGroup
          : propertyGroup // ignore: cast_nullable_to_non_nullable
              as List<GroupProperties>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompareStateCopyWith<$Res>
    implements $CompareStateCopyWith<$Res> {
  factory _$$_CompareStateCopyWith(
          _$_CompareState value, $Res Function(_$_CompareState) then) =
      __$$_CompareStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<List<ProductData>> compare,
      List<GroupProperties> extraGroup,
      List<GroupProperties> propertyGroup});
}

/// @nodoc
class __$$_CompareStateCopyWithImpl<$Res>
    extends _$CompareStateCopyWithImpl<$Res, _$_CompareState>
    implements _$$_CompareStateCopyWith<$Res> {
  __$$_CompareStateCopyWithImpl(
      _$_CompareState _value, $Res Function(_$_CompareState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? compare = null,
    Object? extraGroup = null,
    Object? propertyGroup = null,
  }) {
    return _then(_$_CompareState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      compare: null == compare
          ? _value._compare
          : compare // ignore: cast_nullable_to_non_nullable
              as List<List<ProductData>>,
      extraGroup: null == extraGroup
          ? _value._extraGroup
          : extraGroup // ignore: cast_nullable_to_non_nullable
              as List<GroupProperties>,
      propertyGroup: null == propertyGroup
          ? _value._propertyGroup
          : propertyGroup // ignore: cast_nullable_to_non_nullable
              as List<GroupProperties>,
    ));
  }
}

/// @nodoc

class _$_CompareState implements _CompareState {
  const _$_CompareState(
      {this.isLoading = false,
      final List<List<ProductData>> compare = const [],
      final List<GroupProperties> extraGroup = const [],
      final List<GroupProperties> propertyGroup = const []})
      : _compare = compare,
        _extraGroup = extraGroup,
        _propertyGroup = propertyGroup;

  @override
  @JsonKey()
  final bool isLoading;
  final List<List<ProductData>> _compare;
  @override
  @JsonKey()
  List<List<ProductData>> get compare {
    if (_compare is EqualUnmodifiableListView) return _compare;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_compare);
  }

  final List<GroupProperties> _extraGroup;
  @override
  @JsonKey()
  List<GroupProperties> get extraGroup {
    if (_extraGroup is EqualUnmodifiableListView) return _extraGroup;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extraGroup);
  }

  final List<GroupProperties> _propertyGroup;
  @override
  @JsonKey()
  List<GroupProperties> get propertyGroup {
    if (_propertyGroup is EqualUnmodifiableListView) return _propertyGroup;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_propertyGroup);
  }

  @override
  String toString() {
    return 'CompareState(isLoading: $isLoading, compare: $compare, extraGroup: $extraGroup, propertyGroup: $propertyGroup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompareState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._compare, _compare) &&
            const DeepCollectionEquality()
                .equals(other._extraGroup, _extraGroup) &&
            const DeepCollectionEquality()
                .equals(other._propertyGroup, _propertyGroup));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_compare),
      const DeepCollectionEquality().hash(_extraGroup),
      const DeepCollectionEquality().hash(_propertyGroup));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompareStateCopyWith<_$_CompareState> get copyWith =>
      __$$_CompareStateCopyWithImpl<_$_CompareState>(this, _$identity);
}

abstract class _CompareState implements CompareState {
  const factory _CompareState(
      {final bool isLoading,
      final List<List<ProductData>> compare,
      final List<GroupProperties> extraGroup,
      final List<GroupProperties> propertyGroup}) = _$_CompareState;

  @override
  bool get isLoading;
  @override
  List<List<ProductData>> get compare;
  @override
  List<GroupProperties> get extraGroup;
  @override
  List<GroupProperties> get propertyGroup;
  @override
  @JsonKey(ignore: true)
  _$$_CompareStateCopyWith<_$_CompareState> get copyWith =>
      throw _privateConstructorUsedError;
}
