import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'crypto_coin_list_app.dart';
import 'repositoreis/crypto_coins/crypto_coins.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final talker = TalkerFlutter.init();

  GetIt.I.registerSingleton(talker);

  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  const cryptoCoinsBoxName = 'crypt_coin_box';

  await Hive.initFlutter();

  Hive.registerAdapter(CryptoCoinAdapter());
  Hive.registerAdapter(CryptoCoinDetailAdapter());

  final cryptoCoinBox = await Hive.openBox<CryptoCoin>(cryptoCoinsBoxName);

  {
    ///These all for logging
    GetIt.I<Talker>().debug('Talker started');

    dio.interceptors.add(
      TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(printResponseData: false),
      ),
    );

    Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: TalkerBlocLoggerSettings(
        printEventFullData: false,
        printStateFullData: false,
      ),
    );

    /// This handle for error from flutter widget part
    FlutterError.onError = (detail) =>
        GetIt.I<Talker>().handle(detail.exception, detail.stack);
  }
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CryptoCoinsRepository(dio: dio, cryptCoinBox: cryptoCoinBox),
  );

  runApp(const CryptoCoinListApp());
}
