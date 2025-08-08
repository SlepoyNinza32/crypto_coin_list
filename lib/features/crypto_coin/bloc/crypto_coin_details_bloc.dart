import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../repositoreis/crypto_coins/abstract_coins_repository.dart';
import '../../../repositoreis/crypto_coins/models/models.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailState> {
  CryptoCoinDetailBloc(this.coinsRepository)
    : super(CryptoCoinDetailsInitial()) {
    on<LoadCryptoDetails>((event, emit) async {
      try {
        if (state is! CryptoCoinDetailsLoaded) {
          emit(CryptoCoinDetailsLoading());
        }
        final coin = await coinsRepository.getCoinDetails(event.currencyCode);
        emit(CryptoCoinDetailsLoaded(coin: coin));
      } catch (e, st) {
        emit(CryptoCoinDetailsLoadingFailure(error: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }
  final AbstractCoinsRepository coinsRepository;
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
