import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/crypto_coin/bloc/crypto_coin_details_bloc.dart';
import 'package:crypto_coins_list/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_coins_list/repositoreis/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key, required this.currencyCode});
  final String currencyCode;

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  final _cryptoDetailBloc = CryptoCoinDetailBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  // @override
  // void didChangeDependencies() {
  //   final args = ModalRoute.of(context)?.settings.arguments;
  //   assert(args != null && args is String, 'You must provide String args');

  //   String currencyCode = args as String;
  //   debugPrint('Hell Noooo $currencyCode');
  //   _cryptoDetailBloc.add(LoadCryptoDetails(currencyCode));
  //   super.didChangeDependencies();
  // }
  @override
  void initState() {
    _cryptoDetailBloc.add(LoadCryptoDetails(widget.currencyCode));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CryptoCoinDetailBloc, CryptoCoinDetailState>(
        bloc: _cryptoDetailBloc,
        builder: (context, state) {
          if (state is CryptoCoinDetailsLoaded) {
            return Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    state.coin.details.fullImageUrl,
                    height: 200,
                    width: 200,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.signal_wifi_connected_no_internet_4,
                      ); // or a placeholder
                    },
                  ),
                  Text(state.coin.name, style: theme.textTheme.titleMedium),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: Text(
                      '${state.coin.details.priceInUSD} \$',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'High 24 Hour',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${state.coin.details.high24Hour} \$',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Low 24 Hour',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${state.coin.details.low24Hour} \$',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is CryptoListLoadingFailure) {
            debugPrint(state as String?);
            return Container();
          }

          return Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }

  final a = Container();
}
