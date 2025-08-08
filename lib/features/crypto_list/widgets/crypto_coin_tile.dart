import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/router/router.dart';
import 'package:flutter/material.dart';

import '../../../repositoreis/crypto_coins/models/crypto_coin.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key, required this.coin, required this.theme});

  final CryptoCoin coin;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        coin.details.fullImageUrl,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.signal_wifi_connected_no_internet_4,
          ); // or a placeholder
        },
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text(
        '${coin.details.priceInUSD}\$',
        style: theme.textTheme.labelSmall,
      ),
      onTap: () {
        AutoRouter.of(context).push(CryptoCoinRoute(currencyCode: coin.name));
        // Navigator.of(context).pushNamed('/coin', arguments: coin.name);
      },
    );
  }
}
