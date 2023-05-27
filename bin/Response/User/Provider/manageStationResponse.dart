// ignore_for_file: file_names

import 'package:shelf/shelf.dart';
import 'dart:convert';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import '../../../Services/Supabase/supabaseEnv.dart';

manageStationResponse(Request req) async {
  //create body
  final body = json.decode(await req.readAsString());

  final jwt = JWT.decode(req.headers["authorization"]!);

  //get provider id from table providers by id auth
  final supabase = SupabaseEnv().supabase;
  final result = await supabase
      .from("providers")
      .select("id")
      .eq("id_auth", jwt.payload["sub"]);

  final idprov = result[0]["id"];

  //update work time and status station
  await supabase
      .from("stations")
      .update({"id_prov": idprov, ...body}).eq("id_prov", idprov);

  return Response.ok(
      "The station's working time and station status have been added successfully");
}
