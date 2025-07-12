// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LoginLoading value)?  loginLoading,TResult Function( LoginSuccess value)?  loginSuccess,TResult Function( LoginFailed value)?  loginFailed,TResult Function( SignupLoading value)?  signupLoading,TResult Function( SignupSuccess value)?  signupSuccess,TResult Function( SignupFailed value)?  signupFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoginLoading() when loginLoading != null:
return loginLoading(_that);case LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case LoginFailed() when loginFailed != null:
return loginFailed(_that);case SignupLoading() when signupLoading != null:
return signupLoading(_that);case SignupSuccess() when signupSuccess != null:
return signupSuccess(_that);case SignupFailed() when signupFailed != null:
return signupFailed(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LoginLoading value)  loginLoading,required TResult Function( LoginSuccess value)  loginSuccess,required TResult Function( LoginFailed value)  loginFailed,required TResult Function( SignupLoading value)  signupLoading,required TResult Function( SignupSuccess value)  signupSuccess,required TResult Function( SignupFailed value)  signupFailed,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoginLoading():
return loginLoading(_that);case LoginSuccess():
return loginSuccess(_that);case LoginFailed():
return loginFailed(_that);case SignupLoading():
return signupLoading(_that);case SignupSuccess():
return signupSuccess(_that);case SignupFailed():
return signupFailed(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LoginLoading value)?  loginLoading,TResult? Function( LoginSuccess value)?  loginSuccess,TResult? Function( LoginFailed value)?  loginFailed,TResult? Function( SignupLoading value)?  signupLoading,TResult? Function( SignupSuccess value)?  signupSuccess,TResult? Function( SignupFailed value)?  signupFailed,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoginLoading() when loginLoading != null:
return loginLoading(_that);case LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case LoginFailed() when loginFailed != null:
return loginFailed(_that);case SignupLoading() when signupLoading != null:
return signupLoading(_that);case SignupSuccess() when signupSuccess != null:
return signupSuccess(_that);case SignupFailed() when signupFailed != null:
return signupFailed(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loginLoading,TResult Function( LoginResponseEntity login)?  loginSuccess,TResult Function( String message)?  loginFailed,TResult Function()?  signupLoading,TResult Function( SignupResponseEntity signup)?  signupSuccess,TResult Function( String message)?  signupFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoginLoading() when loginLoading != null:
return loginLoading();case LoginSuccess() when loginSuccess != null:
return loginSuccess(_that.login);case LoginFailed() when loginFailed != null:
return loginFailed(_that.message);case SignupLoading() when signupLoading != null:
return signupLoading();case SignupSuccess() when signupSuccess != null:
return signupSuccess(_that.signup);case SignupFailed() when signupFailed != null:
return signupFailed(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loginLoading,required TResult Function( LoginResponseEntity login)  loginSuccess,required TResult Function( String message)  loginFailed,required TResult Function()  signupLoading,required TResult Function( SignupResponseEntity signup)  signupSuccess,required TResult Function( String message)  signupFailed,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoginLoading():
return loginLoading();case LoginSuccess():
return loginSuccess(_that.login);case LoginFailed():
return loginFailed(_that.message);case SignupLoading():
return signupLoading();case SignupSuccess():
return signupSuccess(_that.signup);case SignupFailed():
return signupFailed(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loginLoading,TResult? Function( LoginResponseEntity login)?  loginSuccess,TResult? Function( String message)?  loginFailed,TResult? Function()?  signupLoading,TResult? Function( SignupResponseEntity signup)?  signupSuccess,TResult? Function( String message)?  signupFailed,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoginLoading() when loginLoading != null:
return loginLoading();case LoginSuccess() when loginSuccess != null:
return loginSuccess(_that.login);case LoginFailed() when loginFailed != null:
return loginFailed(_that.message);case SignupLoading() when signupLoading != null:
return signupLoading();case SignupSuccess() when signupSuccess != null:
return signupSuccess(_that.signup);case SignupFailed() when signupFailed != null:
return signupFailed(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class LoginLoading implements AuthState {
  const LoginLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loginLoading()';
}


}




/// @nodoc


class LoginSuccess implements AuthState {
  const LoginSuccess({required this.login});
  

 final  LoginResponseEntity login;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginSuccessCopyWith<LoginSuccess> get copyWith => _$LoginSuccessCopyWithImpl<LoginSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSuccess&&(identical(other.login, login) || other.login == login));
}


@override
int get hashCode => Object.hash(runtimeType,login);

@override
String toString() {
  return 'AuthState.loginSuccess(login: $login)';
}


}

/// @nodoc
abstract mixin class $LoginSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $LoginSuccessCopyWith(LoginSuccess value, $Res Function(LoginSuccess) _then) = _$LoginSuccessCopyWithImpl;
@useResult
$Res call({
 LoginResponseEntity login
});




}
/// @nodoc
class _$LoginSuccessCopyWithImpl<$Res>
    implements $LoginSuccessCopyWith<$Res> {
  _$LoginSuccessCopyWithImpl(this._self, this._then);

  final LoginSuccess _self;
  final $Res Function(LoginSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? login = null,}) {
  return _then(LoginSuccess(
login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as LoginResponseEntity,
  ));
}


}

/// @nodoc


class LoginFailed implements AuthState {
  const LoginFailed({required this.message});
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginFailedCopyWith<LoginFailed> get copyWith => _$LoginFailedCopyWithImpl<LoginFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.loginFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginFailedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $LoginFailedCopyWith(LoginFailed value, $Res Function(LoginFailed) _then) = _$LoginFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LoginFailedCopyWithImpl<$Res>
    implements $LoginFailedCopyWith<$Res> {
  _$LoginFailedCopyWithImpl(this._self, this._then);

  final LoginFailed _self;
  final $Res Function(LoginFailed) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LoginFailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignupLoading implements AuthState {
  const SignupLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.signupLoading()';
}


}




/// @nodoc


class SignupSuccess implements AuthState {
  const SignupSuccess({required this.signup});
  

 final  SignupResponseEntity signup;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupSuccessCopyWith<SignupSuccess> get copyWith => _$SignupSuccessCopyWithImpl<SignupSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupSuccess&&(identical(other.signup, signup) || other.signup == signup));
}


@override
int get hashCode => Object.hash(runtimeType,signup);

@override
String toString() {
  return 'AuthState.signupSuccess(signup: $signup)';
}


}

/// @nodoc
abstract mixin class $SignupSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $SignupSuccessCopyWith(SignupSuccess value, $Res Function(SignupSuccess) _then) = _$SignupSuccessCopyWithImpl;
@useResult
$Res call({
 SignupResponseEntity signup
});




}
/// @nodoc
class _$SignupSuccessCopyWithImpl<$Res>
    implements $SignupSuccessCopyWith<$Res> {
  _$SignupSuccessCopyWithImpl(this._self, this._then);

  final SignupSuccess _self;
  final $Res Function(SignupSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? signup = null,}) {
  return _then(SignupSuccess(
signup: null == signup ? _self.signup : signup // ignore: cast_nullable_to_non_nullable
as SignupResponseEntity,
  ));
}


}

/// @nodoc


class SignupFailed implements AuthState {
  const SignupFailed({required this.message});
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupFailedCopyWith<SignupFailed> get copyWith => _$SignupFailedCopyWithImpl<SignupFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.signupFailed(message: $message)';
}


}

/// @nodoc
abstract mixin class $SignupFailedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $SignupFailedCopyWith(SignupFailed value, $Res Function(SignupFailed) _then) = _$SignupFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SignupFailedCopyWithImpl<$Res>
    implements $SignupFailedCopyWith<$Res> {
  _$SignupFailedCopyWithImpl(this._self, this._then);

  final SignupFailed _self;
  final $Res Function(SignupFailed) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SignupFailed(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
