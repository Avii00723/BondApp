import 'package:freezed_annotation/freezed_annotation.dart';

part 'bond_model.freezed.dart';
part 'bond_model.g.dart';

@freezed
class BondModel with _$BondModel {
  const factory BondModel({
    required String id,
    required String companyName,
    required String symbol,
    required double currentPrice,
    required double previousClose,
    required double changePercent,
    required String sector,
    required double marketCap,
    @Default('₹') String currency,
  }) = _BondModel;

  factory BondModel.fromJson(Map<String, dynamic> json) =>
      _$BondModelFromJson(json);
}