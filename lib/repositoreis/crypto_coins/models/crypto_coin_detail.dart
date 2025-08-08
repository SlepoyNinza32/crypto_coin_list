import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_detail.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinDetail extends Equatable {
  const CryptoCoinDetail({
    required this.priceInUSD,
    required this.high24Hour,
    required this.low24Hour,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
  });
  @HiveField(0)
  @JsonKey(name: "PRICE")
  final double priceInUSD;

  @HiveField(1)
  @JsonKey(name: "HIGH24HOUR")
  final double high24Hour;

  @HiveField(2)
  @JsonKey(name: "LOW24HOUR")
  final double low24Hour;

  @HiveField(3)
  @JsonKey(name: "IMAGEURL")
  final String imageUrl;

  @HiveField(4)
  @JsonKey(name: "TOSYMBOL")
  final String toSymbol;

  @HiveField(5)
  @JsonKey(
    name: "LASTUPDATE",
    toJson: _dateTimeToJson,
    fromJson: _dateTimeFromJson,
  )
  final DateTime lastUpdate;

  String get fullImageUrl => "https://www.cryptocompare.com/$imageUrl";

  factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailFromJson(json);

  /// Connect the generated [_$CryptoCoinDetailToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CryptoCoinDetailToJson(this);

  static int _dateTimeToJson(DateTime time) => time.microsecondsSinceEpoch;
  static DateTime _dateTimeFromJson(int millisecondas) =>
      DateTime.fromMicrosecondsSinceEpoch(millisecondas);

  @override
  List<Object?> get props => [
    priceInUSD,
    imageUrl,
    high24Hour,
    low24Hour,
    lastUpdate,
    toSymbol,
  ];
}
