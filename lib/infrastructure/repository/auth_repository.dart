import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:gshop/domain/di/dependency_manager.dart';
import 'package:gshop/domain/interface/auth.dart';
import 'package:gshop/domain/model/model/user_model.dart';
import 'package:gshop/domain/model/response/login_response.dart';
import 'package:gshop/domain/model/response/verify_phone_response.dart';
import 'package:gshop/domain/service/helper.dart';
import 'package:gshop/infrastructure/firebase/firebase_service.dart';
import 'package:gshop/infrastructure/local_storage/local_storage.dart';

class AuthRepository implements AuthInterface {
  @override
  Future<Either<LoginResponse, dynamic>> login({
    required String phone,
    required String password,
  }) async {
    dynamic data;
    if (AppHelper.checkPhone(phone.replaceAll(" ", ""))) {
      data = {
        'phone': formatPhoneNumber2(phone.toString()),
        // phone.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", ""),
        'password': password
      };
    } else {
      data = {"email": phone, 'password': password};
    }

    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/login',
        queryParameters: data,
      );
      return left(LoginResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> login failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<LoginResponse, dynamic>> loginWithSocial({
    required String email,
    required String displayName,
    required String id,
    required String? img,
  }) async {
    final data = {
      'email': email,
      'name': displayName,  
      'id': id,
      if (img != null) 'img': img,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/google/callback',
        queryParameters: data,
      );
      return left(LoginResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> login with google failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future updateFirebaseToken(String? token) async {
    final data = {if (token != null) 'firebase_token': token};
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/profile/firebase/token/update',
        data: data,
      );
    } catch (e) {
      debugPrint('==> login with google failure: $e');
    }
  }

  @override
  Future<Either<VerifyData, dynamic>> sigUpWithPhone(
      {required UserModel user}) async {
    try {
      if(user.id==null){
        user=user.copyWith(id: user.phone?.replaceAll('+', '0').toString()??'0');
      }
      print("useruseruseruseruser ${user.toJson()}");
      final client = dioHttp.client(requireAuth: false);
      final res = await client.post(
        '/api/v1/auth/verify/phone',
        data: user.toJson(),
      );
      return left(VerifyPhoneResponse.fromJson(res.data).data ?? VerifyData());
    } catch (e) {
      debugPrint('==> sign up phone failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future logout() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final fcm = FirebaseService.getFcmToken();
      await client.post(
        '/api/v1/auth/logout',
        data: {"firebase_token": fcm},
      );
      LocalStorage.clear();
      return left(true);
    } catch (e) {
      debugPrint('==> firebase token failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future deleteAccount() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/user/profile/delete',
      );
      LocalStorage.clear();
      return left(true);
    } catch (e) {
      debugPrint('==> sign up phone failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<bool, dynamic>> checkPhone({required String phone}) async {
    final data = {'phone': formatPhoneNumber2(phone)};

    print("${data} datadata");
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/check/phone',
        queryParameters: data,
      );
      print("${response.realUri.query}response.realUri");
      return left(response.data?["data"]?["exist"] ?? false);
    } catch (e) {
      debugPrint('==> login failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<LoginResponse, dynamic>> forgotPasswordAfter(
      {required String phone,
      required String verificationId,
      required String password}) async {
    final data = {
      'phone': formatPhoneNumber2(phone.toString()),
      // phone.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", ""),
      "id": verificationId,
      "type": "firebase",
      "password": password
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final res = await client.post(
        '/api/v1/auth/forgot/password/confirm',
        data: data,
      );
      return left(LoginResponse.fromJson(res.data));
    } catch (e) {
      debugPrint('==> forgot failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future updateSetting() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      client.put(
        '/api/v1/dashboard/user/profile/lang/update?lang=${LocalStorage.getLanguage()?.locale}',
      );
      client.put(
        '/api/v1/dashboard/user/profile/currency/update?currency_id=${LocalStorage.getSelectedCurrency()?.id}',
      );
      return left(true);
    } catch (e) {
      debugPrint('==> forgot failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }
}

String formatPhoneNumber(String input) {
  // Remove all non-numeric characters from the input
  String numericString =
      input.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", "");
  // Add the country code and leading zero if missing
  print("numericStringnumericStringnumericString00 ${numericString}");

  if (numericString.startsWith('0')) {
    print("objectobjectobject${numericString}");

    numericString = '2$numericString';
    // numericString = '20$numericString';
  } else if (!numericString.startsWith('20')) {
    print("objectobjectobject${numericString}");
    numericString = '20$numericString';
  }
  print("numericStringnumericStringnumericString ${numericString}");
  // Insert '+' before the country code
  return '+$numericString';
}

String formatPhoneNumber2(String input) {
  // Remove all non-numeric characters from the input
  String numericString =
      input.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", "");
  // Add the country code and leading zero if missing
  print("numericStringnumericStringnumericString00 ${numericString}");

  if (numericString.startsWith('0')) {
    print("objectobjectobject${numericString}");

    numericString = '2$numericString';
    // numericString = '20$numericString';
  } else if (!numericString.startsWith('20')) {
    print("objectobjectobject${numericString}");
    numericString = '20$numericString';
  }
  print("numericStringnumericStringnumericString ${numericString}");
  // Insert '+' before the country code
  return '$numericString';
}
