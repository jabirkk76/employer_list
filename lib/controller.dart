import 'dart:convert';
import 'package:employee_app/model.dart';
import 'package:http/http.dart' as http;

class ClassController {
  Future<MODEL> controller() async {
    var url =
        await 'https://run.mocky.io/v3/8fa1a07e-a949-4d02-94f3-5aeb102b36b4';
    var urlvar = await http.get(Uri.parse(url));
    var jsondecode;
    var response = await jsonDecode(urlvar.body);
    if (urlvar.statusCode == 200) {
      print(urlvar.body);
    }
    jsondecode = MODEL.fromJson(response);
    return jsondecode;
  }
}
