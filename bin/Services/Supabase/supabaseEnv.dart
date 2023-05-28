// ignore_for_file: file_names

import 'package:supabase/supabase.dart';

class SupabaseEnv {
  final _url = '';
  final _key = '';
  final _jwt = '';

  get getJWT {
    return _jwt;
  }

  SupabaseClient get supabase {
    final supabase = SupabaseClient(_url, _key);

    return supabase;
  }
}
