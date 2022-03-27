import 'package:flutter/cupertino.dart';
import 'package:mvvm/repository/dog_repository.dart';

import '../models/dog.dart';

class DogViewModel extends ChangeNotifier {
  final DogRepository _dogRepository = DogRepository();
  Dog? _dog;
  String extensionName = '';

  Future call() async {
    _dog = await _dogRepository.getDataFetch();
    if (_dog!.url.split('.').last.toString() == 'webm') {
      _dog = await _dogRepository.getDataFetch();
    }
    extensionName = _dog!.url.split('.').last;
  }

  Dog? get myDog => _dog;
}
