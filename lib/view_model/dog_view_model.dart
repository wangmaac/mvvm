import 'package:flutter/cupertino.dart';
import 'package:mvvm/repository/dog_repository.dart';

import '../models/dog.dart';

class DogViewModel extends ChangeNotifier {
  DogRepository _dogRepository = DogRepository();
  Dog? _dog;

  Future call() async {
    _dog = await _dogRepository.getDataFetch();
    notifyListeners();
  }

  Dog? get myDog => _dog;
}
