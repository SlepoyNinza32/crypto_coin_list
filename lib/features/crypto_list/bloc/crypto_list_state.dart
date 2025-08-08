part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {
  const CryptoListState();
}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  final List<CryptoCoin> coinList;

  const CryptoListLoaded({required this.coinList});

  @override
  List<Object?> get props => [coinList];
}

class CryptoListLoadingFailure extends CryptoListState {
  const CryptoListLoadingFailure({this.error});

  final Object? error;

  @override
  List<Object?> get props => [error];
}
