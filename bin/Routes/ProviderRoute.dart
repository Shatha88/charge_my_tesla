// ignore_for_file: file_names

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middelwares/User/CheckToken_Middelware.dart';
import '../Response/User/Provider/addStationResponse.dart';

class ProviderRoute {
  Handler get handler {
    final router = Router()..post('/add_station', addStationResponse);
    final pipline =
        Pipeline().addMiddleware(checkTokenMiddleware()).addHandler(router);

    return pipline;
  }
}
