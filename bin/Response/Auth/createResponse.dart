// ignore_for_file: file_names

import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../Models/ConsumerModel.dart';
import '../../Models/ProviderModel.dart';
import '../../RespnseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

createResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    print(body);

    if (req.headers['User-Type']!.toUpperCase() != 'CONSUMER' &&
        req.headers['User-Type']!.toUpperCase() != 'PROVIDER') {
      return CustomResponse().errorResponse(
        msg: "undefined user",
      );
    }

    if (req.headers['User-Type']!.toUpperCase() == 'CONSUMER') {
      if (!body.containsKey('bank_account') &&
          !body.containsKey('email') &&
          !body.containsKey('password')) {
        return CustomResponse().errorResponse(
          msg: "missing required information",
        );
      }

      final supabaseVariable = SupabaseEnv().supabase.auth;
      UserResponse userInfo = await supabaseVariable.admin.createUser(
        AdminUserAttributes(email: body['email'], password: body['password']),
      );

      ConsumerModel userObject = ConsumerModel(
        email: userInfo.user!.email!,
        name: body['name'],
        phone: body['phone'],
        bankAccount: body['bank_account'],
        idAuth: userInfo.user!.id,
      );
      await supabaseVariable.signInWithOtp(email: body['email']);
      await SupabaseEnv().supabase.from("consumers").insert(userObject.toMap());
      return CustomResponse().successResponse(
        msg: "create account page",
        data: {"email": body['email']},
      );
    }

    if (req.headers['User-Type']!.toUpperCase() == 'PROVIDER') {
      if (!body.containsKey('bank_account') &&
          !body.containsKey('email') &&
          !body.containsKey('address') &&
          !body.containsKey('password')) {
        return CustomResponse().errorResponse(
          msg: "missing required information",
        );
      }

      final supabaseVariable = SupabaseEnv().supabase.auth;
      UserResponse userInfo = await supabaseVariable.admin.createUser(
        AdminUserAttributes(email: body['email'], password: body['password']),
      );
      ProviderModel userObject = ProviderModel(
        email: userInfo.user!.email!,
        name: body['name'],
        phone: body['phone'],
        address: body['address'],
        bankAccount: body['bank_account'],
        idAuth: userInfo.user!.id,
      );
      await supabaseVariable.signInWithOtp(email: body['email']);
      await SupabaseEnv().supabase.from("providers").insert(userObject.toMap());
      return CustomResponse().successResponse(
        msg: "create account page",
        data: {"email": body['email']},
      );
    }
  } catch (error) {
    return CustomResponse().errorResponse(
      msg: error.toString(),
    );
  }
}
