// ignore_for_file: file_names

import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../../Services/Supabase/supabaseEnv.dart';

viewOrderResponse(Request req, String id) async{
  
 final jwt = JWT.decode(req.headers["authorization"]!);
  final userAuth = jwt.payload["sub"];
  final supabase = SupabaseEnv().supabase;
  final result =
      await supabase.from("consumers").select("id").eq("id_auth", userAuth);
  final resultContact = await supabase
      .from("oreders")
      .select("*")
      .eq("id_cons", result[0]["id"]);

  return Response.ok(
    json.encode(resultContact),
    headers: {"content-type": "application/json"},
  );
}

