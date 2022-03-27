import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm/models/dog.dart';

class WebService {
  Future getDataToServer() async {
    Uri uri = Uri.parse('https://random.dog/woof.json');

    //Provider.of<LoadingViewModel>(context)

    http.Response _response = await http.get(uri);

    if (_response.statusCode == 200) {
      return Dog.fromJson(jsonDecode(_response.body));
    } else {
      print('${_response.statusCode}:' + _response.body.toString());
      return null;
    }
  }
}
