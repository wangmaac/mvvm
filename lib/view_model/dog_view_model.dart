import 'package:flutter/cupertino.dart';
import 'package:mvvm/repository/dog_repository.dart';
import 'package:mvvm/repository/download_repository.dart';

import '../models/dog.dart';

class DogViewModel extends ChangeNotifier {
  final DogRepository _dogRepository = DogRepository();

  Dog? _dog;
  String extensionName = '';

  Dog? get myDog => _dog;

  Future call() async {
    _dog = await _dogRepository.getDataFetch();
    if (_dog!.url.split('.').last.toString() == 'webm') {
      _dog = await _dogRepository.getDataFetch();
    }
    extensionName = _dog!.url.split('.').last.toLowerCase();
  }

  Future save(BuildContext context) async {
    final DownloadRepository _downloadRepository =
        DownloadRepository(_dog!.url, context);

    if (extensionName == 'gif') {
      await _downloadRepository.saveGif();
    } else if (extensionName == 'mp4') {
      await _downloadRepository.saveVideo();
    } else {
      await _downloadRepository.getHttp();
    }
  }
}
