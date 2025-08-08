// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyModelImpl _$$CompanyModelImplFromJson(Map<String, dynamic> json) =>
    _$CompanyModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      description: json['description'] as String,
      sector: json['sector'] as String,
      industry: json['industry'] as String,
      marketCap: (json['marketCap'] as num).toDouble(),
      ceo: json['ceo'] as String,
      employees: (json['employees'] as num).toInt(),
      website: json['website'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      bonds: (json['bonds'] as List<dynamic>)
          .map((e) => BondDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      financials: CompanyFinancials.fromJson(
          json['financials'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CompanyModelImplToJson(_$CompanyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'description': instance.description,
      'sector': instance.sector,
      'industry': instance.industry,
      'marketCap': instance.marketCap,
      'ceo': instance.ceo,
      'employees': instance.employees,
      'website': instance.website,
      'address': instance.address,
      'phone': instance.phone,
      'bonds': instance.bonds,
      'financials': instance.financials,
    };

_$BondDetailImpl _$$BondDetailImplFromJson(Map<String, dynamic> json) =>
    _$BondDetailImpl(
      bondId: json['bondId'] as String,
      bondName: json['bondName'] as String,
      isin: json['isin'] as String,
      faceValue: (json['faceValue'] as num).toDouble(),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      yield: (json['yield'] as num).toDouble(),
      maturityDate: json['maturityDate'] as String,
      rating: json['rating'] as String,
      ratingAgency: json['ratingAgency'] as String,
      interestRate: (json['interestRate'] as num).toDouble(),
      paymentFrequency: json['paymentFrequency'] as String,
    );

Map<String, dynamic> _$$BondDetailImplToJson(_$BondDetailImpl instance) =>
    <String, dynamic>{
      'bondId': instance.bondId,
      'bondName': instance.bondName,
      'isin': instance.isin,
      'faceValue': instance.faceValue,
      'currentPrice': instance.currentPrice,
      'yield': instance.yield,
      'maturityDate': instance.maturityDate,
      'rating': instance.rating,
      'ratingAgency': instance.ratingAgency,
      'interestRate': instance.interestRate,
      'paymentFrequency': instance.paymentFrequency,
    };

_$CompanyFinancialsImpl _$$CompanyFinancialsImplFromJson(
        Map<String, dynamic> json) =>
    _$CompanyFinancialsImpl(
      revenue: (json['revenue'] as num).toDouble(),
      profit: (json['profit'] as num).toDouble(),
      debt: (json['debt'] as num).toDouble(),
      equity: (json['equity'] as num).toDouble(),
      roa: (json['roa'] as num).toDouble(),
      roe: (json['roe'] as num).toDouble(),
      eps: (json['eps'] as num).toDouble(),
      peRatio: (json['peRatio'] as num).toDouble(),
    );

Map<String, dynamic> _$$CompanyFinancialsImplToJson(
        _$CompanyFinancialsImpl instance) =>
    <String, dynamic>{
      'revenue': instance.revenue,
      'profit': instance.profit,
      'debt': instance.debt,
      'equity': instance.equity,
      'roa': instance.roa,
      'roe': instance.roe,
      'eps': instance.eps,
      'peRatio': instance.peRatio,
    };
