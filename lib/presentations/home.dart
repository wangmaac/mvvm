import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
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

  late NumberFormat df;

  @override
  void initState() {
    init();
    df = NumberFormat('###,###,###,###');
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text(AppLocalizations.of(context)!.title),
        centerTitle: true,
        actions: [
          isSaving
              ? Center(child: Text(AppLocalizations.of(context)!.saving))
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
                  icon: const Icon(
                    Icons.download,
                  ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Provider.of<DogViewModel>(context).myDog != null && isDone
                ? Expanded(
                    child: Image.network(
                      Provider.of<DogViewModel>(context).myDog!.url,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.low,
                      width: double.infinity,
                      height: 500,
                      loadingBuilder: (context, widget, chunkEvent) {
                        if (chunkEvent == null) return widget;
                        return Center(
                            child: Center(
                          child: Text(AppLocalizations.of(context)!.loading),
                        ));
                      },
                      errorBuilder: (context, object, trace) {
                        return Center(
                          child: MyVideoPlayer(
                            source:
                                Provider.of<DogViewModel>(context).myDog!.url,
                          ),
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: Center(
                        child: CircularProgressIndicator.adaptive(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.pink.shade100),
                    )),
                  ),
            //todo description widget
            Provider.of<DogViewModel>(context).myDog != null && isDone
                ? Container(
                    padding: const EdgeInsets.only(left: 10),
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
                              '${AppLocalizations.of(context)!.extension} : ${Provider.of<DogViewModel>(context, listen: false).extensionName.toLowerCase()}'),
                          Text(
                              '${AppLocalizations.of(context)!.size} : ${df.format((Provider.of<DogViewModel>(context, listen: false).myDog!.fileSizeBytes / 1024).ceil())} ${AppLocalizations.of(context)!.byte}'),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 50,
                  ),
            const SizedBox(height: 30),
            OutlinedButton(
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
              child: Center(child: Image.asset('assets/images/right_icon.png')),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.fromLTRB(10, 10, 10, 10)),
                  fixedSize: MaterialStateProperty.all<Size>(
                      const Size.fromHeight(60)),
                  elevation: MaterialStateProperty.all<double>(0.0),
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.white38;
                      } else {
                        return Colors.yellow;
                      }
                    },
                  ),
                  side: MaterialStateProperty.resolveWith<BorderSide>((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const BorderSide(color: Colors.white);
                    } else {
                      return const BorderSide(color: Colors.black);
                    }
                  }),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            const SizedBox(
              height: 100,
            )
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
