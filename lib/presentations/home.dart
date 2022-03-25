import 'package:flutter/material.dart';
import 'package:mvvm/presentations/video.dart';
import 'package:mvvm/view_model/dog_view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Provider.of<DogViewModel>(context, listen: false).call();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Provider.of<DogViewModel>(context).myDog != null
                  ? Image.network(
                      Provider.of<DogViewModel>(context).myDog!.url,
                      fit: BoxFit.cover,
                      errorBuilder: (context, object, trace) {
                        List tmpList = Provider.of<DogViewModel>(context)
                            .myDog!
                            .url
                            .split('.');
                        print(tmpList.last);
                        return MyVideoPlayer(
                          source: Provider.of<DogViewModel>(context).myDog!.url,
                        );

                        Center(
                            child: Text(
                                '${Provider.of<DogViewModel>(context).myDog!.url}'));
                      },
                    )
                  : SizedBox(
                      width: double.infinity,
                      height: 300,
                    ),
            ),
            OutlinedButton.icon(
                onPressed: () {
                  Provider.of<DogViewModel>(context, listen: false).call();
                },
                icon: Icon(Icons.sick_sharp),
                label: Text('text')),
          ],
        ),
      ),
    );

    /*ChangeNotifierProvider<DogViewModel>(
      create: (_) => DogViewModel(),
      builder: (context, widget) {
        return Scaffold(body: SafeArea(child: Consumer<DogViewModel>(
          builder: (context, viweModel, widget) {
            return Center(
                child: Column(children: [
              Container(
                  width: double.infinity,
                  height: 500,
                  color: Colors.blue,
                  child: Text('a')),

            ]));
          },
        )));
      },
    );*/
  }

  Future init() async {
    await Provider.of<DogViewModel>(context, listen: false).call();
  }
}
