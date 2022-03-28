import 'package:flutter/material.dart';
import 'package:mvvm/presentations/video.dart';
import 'package:mvvm/view_model/dog_view_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDone = false;
  bool isSaving = false;

  @override
  void initState() {
    init();
    _requestPermission();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    print(statuses[Permission.storage].toString());
  }

  @override
  Widget build(BuildContext context) {
    double ratio = MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height / 2);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pink.shade100,
        title: const Text('뭥... 뭥...'),
        centerTitle: true,
        actions: [
          isSaving
              ? Center(child: Text('Saving...'))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSaving = true;
                    });
                    Provider.of<DogViewModel>(context, listen: false)
                        .save(context)
                        .then((value) {
                      setState(() {
                        isSaving = false;
                      });
                    });
                  },
                  icon: const Icon(Icons.save))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: Provider.of<DogViewModel>(context).myDog != null &&
                        isDone
                    ? Stack(
                        children: [
                          Center(
                            child: AspectRatio(
                              aspectRatio: ratio,
                              child: Image.network(
                                Provider.of<DogViewModel>(context).myDog!.url,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.low,
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 2,
                                cacheHeight: 720,
                                loadingBuilder: (context, widget, chunkEvent) {
                                  if (chunkEvent == null) return widget;
                                  return Center(
                                      child: Center(
                                    child: Text('Loading....'),
                                  ));
                                },
                                errorBuilder: (context, object, trace) {
                                  return MyVideoPlayer(
                                    source: Provider.of<DogViewModel>(context)
                                        .myDog!
                                        .url,
                                  );
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              color: Colors.black.withOpacity(0.3),
                              child: DefaultTextStyle(
                                style: const TextStyle(color: Colors.white),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '확장자명 : ${Provider.of<DogViewModel>(context, listen: false).extensionName.toLowerCase()}'),
                                    Text(
                                        '파일사이즈 : ${Provider.of<DogViewModel>(context, listen: false).myDog!.fileSizeBytes.toString()}byte'),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : SizedBox(
                        child: Center(
                            child: CircularProgressIndicator.adaptive(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.pink.shade100),
                        )),
                        width: double.infinity,
                        height: 300,
                      )),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: () {
                setState(() {
                  isDone = false;
                });
                Provider.of<DogViewModel>(context, listen: false)
                    .call()
                    .then((value) {
                  setState(() {
                    isDone = true;
                  });
                });
              },
              icon: const Icon(
                Icons.navigate_next,
                color: Colors.black,
                size: 30,
              ),
              label: const Text(
                '다음',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.fromLTRB(10, 10, 20, 10)),
                elevation: MaterialStateProperty.all<double>(2.0),
                shadowColor:
                    MaterialStateProperty.all<Color>(Colors.pink.shade100),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.pink.shade100),
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.pink.shade100),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.pink.shade100;
                    } else {
                      return Colors.white;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future init() async {
    await Provider.of<DogViewModel>(context, listen: false)
        .call()
        .then((value) {
      if (mounted) {
        setState(() {
          isDone = true;
        });
      }
    });
  }
}
