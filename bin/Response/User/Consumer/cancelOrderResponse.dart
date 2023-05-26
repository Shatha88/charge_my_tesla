// ignore_for_file: file_names

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../../Services/Supabase/supabaseEnv.dart';
//

cancelOrderResponse(Request req,String id ) async{
  final jwt =JWT.decode(req.headers['authorization']!);

  final Supabase =SupabaseEnv().supabase;
  final Listorder =await Supabase
  .from("consumers")
  .select("id")
  .eq("id_auth",jwt.payload['sub']);

  await Supabase
  .from("oreders")
  .delete()
  .eq("id_cons",Listorder[0]["id"])
  .eq("id",int.parse(id));

  

  //return Response.ok('cancelOrderResponse');
}
