import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class DownloadRepository {
  final String url;
  final BuildContext context;
  DownloadRepository(this.url, this.context);

  String getFileName() {
    List list = url.split('.');
    return (list[list.length - 2].split('/').last);
  }

  Future getHttp() async {
    var response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 100,
        name: getFileName());
    print(result.toString());
    if (result['isSuccess']) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('갤러리에 저장되었습니다.')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('실패했습니다. ${result['errorMessage']}')));
    }
  }

  Future saveGif() async {
    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + "/${getFileName()}.gif";
    String fileUrl = url;
    await Dio().download(fileUrl, savePath);
    final result = await ImageGallerySaver.saveFile(savePath);
    if (result['isSuccess']) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('갤러리에 저장되었습니다.')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('실패했습니다. ${result['errorMessage']}')));
    }
  }

  Future saveVideo() async {
    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + "/${getFileName()}}.mp4";
    String fileUrl = url;
    await Dio().download(fileUrl, savePath, onReceiveProgress: (count, total) {
      print((count / total * 100).toStringAsFixed(0) + "%");
    });
    final result = await ImageGallerySaver.saveFile(savePath);
    if (result['isSuccess']) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('갤러리에 저장되었습니다.')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('실패했습니다. ${result['errorMessage']}')));
    }
  }
}
