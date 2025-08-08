import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
class CompanyModel with _$CompanyModel {
  const factory CompanyModel({
    required String id,
    required String name,
    required String symbol,
    required String description,
    required String sector,
    required String industry,
    required double marketCap,
    required String ceo,
    required int employees,
    required String website,
    required String address,
    required String phone,
    required List<BondDetail> bonds,
    required CompanyFinancials financials,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);
}

@freezed
class BondDetail with _$BondDetail {
  const factory BondDetail({
    required String bondId,
    required String bondName,
    required String isin,
    required double faceValue,
    required double currentPrice,
    required double yield,
    required String maturityDate,
    required String rating,
    required String ratingAgency,
    required double interestRate,
    required String paymentFrequency,
  }) = _BondDetail;

  factory BondDetail.fromJson(Map<String, dynamic> json) =>
      _$BondDetailFromJson(json);
}

@freezed
class CompanyFinancials with _$CompanyFinancials {
  const factory CompanyFinancials({
    required double revenue,
    required double profit,
    required double debt,
    required double equity,
    required double roa,
    required double roe,
    required double eps,
    required double peRatio,
  }) = _CompanyFinancials;

  factory CompanyFinancials.fromJson(Map<String, dynamic> json) =>
      _$CompanyFinancialsFromJson(json);
}