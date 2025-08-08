// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bond_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BondModelImpl _$$BondModelImplFromJson(Map<String, dynamic> json) =>
    _$BondModelImpl(
      id: json['id'] as String,
      companyName: json['companyName'] as String,
      symbol: json['symbol'] as String,
      currentPrice: (json['currentPrice'] as num).toDouble(),
      previousClose: (json['previousClose'] as num).toDouble(),
      changePercent: (json['changePercent'] as num).toDouble(),
      sector: json['sector'] as String,
      marketCap: (json['marketCap'] as num).toDouble(),
      currency: json['currency'] as String? ?? '₹',
    );

Map<String, dynamic> _$$BondModelImplToJson(_$BondModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'symbol': instance.symbol,
      'currentPrice': instance.currentPrice,
      'previousClose': instance.previousClose,
      'changePercent': instance.changePercent,
      'sector': instance.sector,
      'marketCap': instance.marketCap,
      'currency': instance.currency,
    };
