import 'package:mvvm/service/webservice.dart';

class DogRepository {
  final WebService _webService = WebService();

  Future getDataFetch() async {
    return await _webService.getDataToServer();
  }
}
