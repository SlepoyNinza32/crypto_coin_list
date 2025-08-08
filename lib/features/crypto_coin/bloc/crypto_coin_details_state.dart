part of 'crypto_coin_details_bloc.dart';

abstract class CryptoCoinDetailState extends Equatable {}

class CryptoCoinDetailsInitial extends CryptoCoinDetailState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CryptoCoinDetailsLoading extends CryptoCoinDetailState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CryptoCoinDetailsLoaded extends CryptoCoinDetailState {
  final CryptoCoin coin;

  CryptoCoinDetailsLoaded({required this.coin});

  @override
  List<Object?> get props => [coin];
}

class CryptoCoinDetailsLoadingFailure extends CryptoCoinDetailState {
  CryptoCoinDetailsLoadingFailure({this.error});

  final Object? error;

  @override
  List<Object?> get props => [error];
}
