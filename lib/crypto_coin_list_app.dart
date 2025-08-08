import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class CryptoCoinListApp extends StatefulWidget {
  const CryptoCoinListApp({super.key});

  @override
  State<CryptoCoinListApp> createState() => _CryptoCoinListAppState();
}

class _CryptoCoinListAppState extends State<CryptoCoinListApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Crypto Currencies List',
      theme: darkTheme,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [TalkerRouteObserver(GetIt.I<Talker>())],
      ),
    );
  }
}
