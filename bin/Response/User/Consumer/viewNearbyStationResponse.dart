// ignore_for_file: file_names

import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../../Services/Supabase/supabaseEnv.dart';
//get
viewNearbyStationResponse(Request req,String address)async {
 final jwt = JWT.decode(req.headers["authorization"]!);
  final userAuth = jwt.payload["sub"];
  final supabase = SupabaseEnv().supabase;
  final result =
      await supabase.from("consumers").select("address").eq("id_auth", userAuth);
  final resultContact = await supabase
      .from("stations")
      .select("location,rating")
      .eq("locations", result[0]["address"]);

  return Response.ok(
    json.encode(resultContact),
    headers: {"content-type": "application/json"},
  );
}
