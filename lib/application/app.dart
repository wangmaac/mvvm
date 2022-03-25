import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/view_model/dog_view_model.dart';
import 'package:provider/provider.dart';

import '../presentations/home.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GoRouter _goRouter = GoRouter(routes: <GoRoute>[
      GoRoute(path: '/', builder: (context, state) => Home()),
    ]);

    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => DogViewModel())],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: _goRouter.routeInformationParser,
          routerDelegate: _goRouter.routerDelegate,
          theme: ThemeData(
            //primarySwatch: Colors.black,
            primaryColor: Colors.black,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            backgroundColor: Colors.pink,
          ),
          //darkTheme: ThemeData.dark(),
        ));
  }
}
