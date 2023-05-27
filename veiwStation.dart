// ignore_for_file: file_names


import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../../Services/Supabase/supabaseEnv.dart';

// disblay id and level of stations
veiwStation(Request request)async{

  // display sations id and level
  final supabase = SupabaseEnv().supabase;
  final station = (await supabase
      .from("stations")
      .select("id,rating"));
  
  return Response.ok(
    json.encode(station),
    headers: {"content-type": "application/json"},);
}

