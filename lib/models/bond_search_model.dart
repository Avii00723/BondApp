import 'package:freezed_annotation/freezed_annotation.dart';

part 'bond_search_model.freezed.dart';
part 'bond_search_model.g.dart';

@freezed
class BondSearchModel with _$BondSearchModel {
  const factory BondSearchModel({
    required String logo,
    required String isin,
    required String rating,
    @JsonKey(name: 'company_name') required String companyName,
    required List<String> tags,
  }) = _BondSearchModel;

  factory BondSearchModel.fromJson(Map<String, dynamic> json) =>
      _$BondSearchModelFromJson(json);
}

@freezed
class BondDetailModel with _$BondDetailModel {
  const factory BondDetailModel({
    required String logo,
    @JsonKey(name: 'company_name') required String companyName,
    required String description,
    required String isin,
    required String status,
    @JsonKey(name: 'pros_and_cons') required ProsAndCons prosAndCons,
    required FinancialData financials,
    @JsonKey(name: 'issuer_details') required IssuerDetails issuerDetails,
  }) = _BondDetailModel;

  factory BondDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BondDetailModelFromJson(json);
}

@freezed
class ProsAndCons with _$ProsAndCons {
  const factory ProsAndCons({
    required List<String> pros,
    required List<String> cons,
  }) = _ProsAndCons;

  factory ProsAndCons.fromJson(Map<String, dynamic> json) =>
      _$ProsAndConsFromJson(json);
}

@freezed
class FinancialData with _$FinancialData {
  const factory FinancialData({
    required List<MonthlyData> ebitda,
    required List<MonthlyData> revenue,
  }) = _FinancialData;

  factory FinancialData.fromJson(Map<String, dynamic> json) =>
      _$FinancialDataFromJson(json);
}

@freezed
class MonthlyData with _$MonthlyData {
  const factory MonthlyData({
    required String month,
    required double value,
  }) = _MonthlyData;

  factory MonthlyData.fromJson(Map<String, dynamic> json) =>
      _$MonthlyDataFromJson(json);
}

@freezed
class IssuerDetails with _$IssuerDetails {
  const factory IssuerDetails({
    @JsonKey(name: 'issuer_name') required String issuerName,
    @JsonKey(name: 'type_of_issuer') required String typeOfIssuer,
    required String sector,
    required String industry,
    @JsonKey(name: 'issuer_nature') required String issuerNature,
    required String cin,
    @JsonKey(name: 'lead_manager') required String leadManager,
    required String registrar,
    @JsonKey(name: 'debenture_trustee') required String debentureTrustee,
  }) = _IssuerDetails;

  factory IssuerDetails.fromJson(Map<String, dynamic> json) =>
      _$IssuerDetailsFromJson(json);
}