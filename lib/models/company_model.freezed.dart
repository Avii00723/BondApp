// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) {
  return _CompanyModel.fromJson(json);
}

/// @nodoc
mixin _$CompanyModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get sector => throw _privateConstructorUsedError;
  String get industry => throw _privateConstructorUsedError;
  double get marketCap => throw _privateConstructorUsedError;
  String get ceo => throw _privateConstructorUsedError;
  int get employees => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  List<BondDetail> get bonds => throw _privateConstructorUsedError;
  CompanyFinancials get financials => throw _privateConstructorUsedError;

  /// Serializes this CompanyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompanyModelCopyWith<CompanyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyModelCopyWith<$Res> {
  factory $CompanyModelCopyWith(
          CompanyModel value, $Res Function(CompanyModel) then) =
      _$CompanyModelCopyWithImpl<$Res, CompanyModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String symbol,
      String description,
      String sector,
      String industry,
      double marketCap,
      String ceo,
      int employees,
      String website,
      String address,
      String phone,
      List<BondDetail> bonds,
      CompanyFinancials financials});

  $CompanyFinancialsCopyWith<$Res> get financials;
}

/// @nodoc
class _$CompanyModelCopyWithImpl<$Res, $Val extends CompanyModel>
    implements $CompanyModelCopyWith<$Res> {
  _$CompanyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? symbol = null,
    Object? description = null,
    Object? sector = null,
    Object? industry = null,
    Object? marketCap = null,
    Object? ceo = null,
    Object? employees = null,
    Object? website = null,
    Object? address = null,
    Object? phone = null,
    Object? bonds = null,
    Object? financials = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sector: null == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String,
      industry: null == industry
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String,
      marketCap: null == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as double,
      ceo: null == ceo
          ? _value.ceo
          : ceo // ignore: cast_nullable_to_non_nullable
              as String,
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as int,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      bonds: null == bonds
          ? _value.bonds
          : bonds // ignore: cast_nullable_to_non_nullable
              as List<BondDetail>,
      financials: null == financials
          ? _value.financials
          : financials // ignore: cast_nullable_to_non_nullable
              as CompanyFinancials,
    ) as $Val);
  }

  /// Create a copy of CompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompanyFinancialsCopyWith<$Res> get financials {
    return $CompanyFinancialsCopyWith<$Res>(_value.financials, (value) {
      return _then(_value.copyWith(financials: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CompanyModelImplCopyWith<$Res>
    implements $CompanyModelCopyWith<$Res> {
  factory _$$CompanyModelImplCopyWith(
          _$CompanyModelImpl value, $Res Function(_$CompanyModelImpl) then) =
      __$$CompanyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String symbol,
      String description,
      String sector,
      String industry,
      double marketCap,
      String ceo,
      int employees,
      String website,
      String address,
      String phone,
      List<BondDetail> bonds,
      CompanyFinancials financials});

  @override
  $CompanyFinancialsCopyWith<$Res> get financials;
}

/// @nodoc
class __$$CompanyModelImplCopyWithImpl<$Res>
    extends _$CompanyModelCopyWithImpl<$Res, _$CompanyModelImpl>
    implements _$$CompanyModelImplCopyWith<$Res> {
  __$$CompanyModelImplCopyWithImpl(
      _$CompanyModelImpl _value, $Res Function(_$CompanyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? symbol = null,
    Object? description = null,
    Object? sector = null,
    Object? industry = null,
    Object? marketCap = null,
    Object? ceo = null,
    Object? employees = null,
    Object? website = null,
    Object? address = null,
    Object? phone = null,
    Object? bonds = null,
    Object? financials = null,
  }) {
    return _then(_$CompanyModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sector: null == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String,
      industry: null == industry
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String,
      marketCap: null == marketCap
          ? _value.marketCap
          : marketCap // ignore: cast_nullable_to_non_nullable
              as double,
      ceo: null == ceo
          ? _value.ceo
          : ceo // ignore: cast_nullable_to_non_nullable
              as String,
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as int,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      bonds: null == bonds
          ? _value._bonds
          : bonds // ignore: cast_nullable_to_non_nullable
              as List<BondDetail>,
      financials: null == financials
          ? _value.financials
          : financials // ignore: cast_nullable_to_non_nullable
              as CompanyFinancials,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyModelImpl implements _CompanyModel {
  const _$CompanyModelImpl(
      {required this.id,
      required this.name,
      required this.symbol,
      required this.description,
      required this.sector,
      required this.industry,
      required this.marketCap,
      required this.ceo,
      required this.employees,
      required this.website,
      required this.address,
      required this.phone,
      required final List<BondDetail> bonds,
      required this.financials})
      : _bonds = bonds;

  factory _$CompanyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String symbol;
  @override
  final String description;
  @override
  final String sector;
  @override
  final String industry;
  @override
  final double marketCap;
  @override
  final String ceo;
  @override
  final int employees;
  @override
  final String website;
  @override
  final String address;
  @override
  final String phone;
  final List<BondDetail> _bonds;
  @override
  List<BondDetail> get bonds {
    if (_bonds is EqualUnmodifiableListView) return _bonds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonds);
  }

  @override
  final CompanyFinancials financials;

  @override
  String toString() {
    return 'CompanyModel(id: $id, name: $name, symbol: $symbol, description: $description, sector: $sector, industry: $industry, marketCap: $marketCap, ceo: $ceo, employees: $employees, website: $website, address: $address, phone: $phone, bonds: $bonds, financials: $financials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sector, sector) || other.sector == sector) &&
            (identical(other.industry, industry) ||
                other.industry == industry) &&
            (identical(other.marketCap, marketCap) ||
                other.marketCap == marketCap) &&
            (identical(other.ceo, ceo) || other.ceo == ceo) &&
            (identical(other.employees, employees) ||
                other.employees == employees) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality().equals(other._bonds, _bonds) &&
            (identical(other.financials, financials) ||
                other.financials == financials));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      symbol,
      description,
      sector,
      industry,
      marketCap,
      ceo,
      employees,
      website,
      address,
      phone,
      const DeepCollectionEquality().hash(_bonds),
      financials);

  /// Create a copy of CompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyModelImplCopyWith<_$CompanyModelImpl> get copyWith =>
      __$$CompanyModelImplCopyWithImpl<_$CompanyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyModelImplToJson(
      this,
    );
  }
}

abstract class _CompanyModel implements CompanyModel {
  const factory _CompanyModel(
      {required final String id,
      required final String name,
      required final String symbol,
      required final String description,
      required final String sector,
      required final String industry,
      required final double marketCap,
      required final String ceo,
      required final int employees,
      required final String website,
      required final String address,
      required final String phone,
      required final List<BondDetail> bonds,
      required final CompanyFinancials financials}) = _$CompanyModelImpl;

  factory _CompanyModel.fromJson(Map<String, dynamic> json) =
      _$CompanyModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get symbol;
  @override
  String get description;
  @override
  String get sector;
  @override
  String get industry;
  @override
  double get marketCap;
  @override
  String get ceo;
  @override
  int get employees;
  @override
  String get website;
  @override
  String get address;
  @override
  String get phone;
  @override
  List<BondDetail> get bonds;
  @override
  CompanyFinancials get financials;

  /// Create a copy of CompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyModelImplCopyWith<_$CompanyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BondDetail _$BondDetailFromJson(Map<String, dynamic> json) {
  return _BondDetail.fromJson(json);
}

/// @nodoc
mixin _$BondDetail {
  String get bondId => throw _privateConstructorUsedError;
  String get bondName => throw _privateConstructorUsedError;
  String get isin => throw _privateConstructorUsedError;
  double get faceValue => throw _privateConstructorUsedError;
  double get currentPrice => throw _privateConstructorUsedError;
  double get yield => throw _privateConstructorUsedError;
  String get maturityDate => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;
  String get ratingAgency => throw _privateConstructorUsedError;
  double get interestRate => throw _privateConstructorUsedError;
  String get paymentFrequency => throw _privateConstructorUsedError;

  /// Serializes this BondDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BondDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BondDetailCopyWith<BondDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BondDetailCopyWith<$Res> {
  factory $BondDetailCopyWith(
          BondDetail value, $Res Function(BondDetail) then) =
      _$BondDetailCopyWithImpl<$Res, BondDetail>;
  @useResult
  $Res call(
      {String bondId,
      String bondName,
      String isin,
      double faceValue,
      double currentPrice,
      double yield,
      String maturityDate,
      String rating,
      String ratingAgency,
      double interestRate,
      String paymentFrequency});
}

/// @nodoc
class _$BondDetailCopyWithImpl<$Res, $Val extends BondDetail>
    implements $BondDetailCopyWith<$Res> {
  _$BondDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BondDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bondId = null,
    Object? bondName = null,
    Object? isin = null,
    Object? faceValue = null,
    Object? currentPrice = null,
    Object? yield = null,
    Object? maturityDate = null,
    Object? rating = null,
    Object? ratingAgency = null,
    Object? interestRate = null,
    Object? paymentFrequency = null,
  }) {
    return _then(_value.copyWith(
      bondId: null == bondId
          ? _value.bondId
          : bondId // ignore: cast_nullable_to_non_nullable
              as String,
      bondName: null == bondName
          ? _value.bondName
          : bondName // ignore: cast_nullable_to_non_nullable
              as String,
      isin: null == isin
          ? _value.isin
          : isin // ignore: cast_nullable_to_non_nullable
              as String,
      faceValue: null == faceValue
          ? _value.faceValue
          : faceValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      yield: null == yield
          ? _value.yield
          : yield // ignore: cast_nullable_to_non_nullable
              as double,
      maturityDate: null == maturityDate
          ? _value.maturityDate
          : maturityDate // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      ratingAgency: null == ratingAgency
          ? _value.ratingAgency
          : ratingAgency // ignore: cast_nullable_to_non_nullable
              as String,
      interestRate: null == interestRate
          ? _value.interestRate
          : interestRate // ignore: cast_nullable_to_non_nullable
              as double,
      paymentFrequency: null == paymentFrequency
          ? _value.paymentFrequency
          : paymentFrequency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BondDetailImplCopyWith<$Res>
    implements $BondDetailCopyWith<$Res> {
  factory _$$BondDetailImplCopyWith(
          _$BondDetailImpl value, $Res Function(_$BondDetailImpl) then) =
      __$$BondDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bondId,
      String bondName,
      String isin,
      double faceValue,
      double currentPrice,
      double yield,
      String maturityDate,
      String rating,
      String ratingAgency,
      double interestRate,
      String paymentFrequency});
}

/// @nodoc
class __$$BondDetailImplCopyWithImpl<$Res>
    extends _$BondDetailCopyWithImpl<$Res, _$BondDetailImpl>
    implements _$$BondDetailImplCopyWith<$Res> {
  __$$BondDetailImplCopyWithImpl(
      _$BondDetailImpl _value, $Res Function(_$BondDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of BondDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bondId = null,
    Object? bondName = null,
    Object? isin = null,
    Object? faceValue = null,
    Object? currentPrice = null,
    Object? yield = null,
    Object? maturityDate = null,
    Object? rating = null,
    Object? ratingAgency = null,
    Object? interestRate = null,
    Object? paymentFrequency = null,
  }) {
    return _then(_$BondDetailImpl(
      bondId: null == bondId
          ? _value.bondId
          : bondId // ignore: cast_nullable_to_non_nullable
              as String,
      bondName: null == bondName
          ? _value.bondName
          : bondName // ignore: cast_nullable_to_non_nullable
              as String,
      isin: null == isin
          ? _value.isin
          : isin // ignore: cast_nullable_to_non_nullable
              as String,
      faceValue: null == faceValue
          ? _value.faceValue
          : faceValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      yield: null == yield
          ? _value.yield
          : yield // ignore: cast_nullable_to_non_nullable
              as double,
      maturityDate: null == maturityDate
          ? _value.maturityDate
          : maturityDate // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      ratingAgency: null == ratingAgency
          ? _value.ratingAgency
          : ratingAgency // ignore: cast_nullable_to_non_nullable
              as String,
      interestRate: null == interestRate
          ? _value.interestRate
          : interestRate // ignore: cast_nullable_to_non_nullable
              as double,
      paymentFrequency: null == paymentFrequency
          ? _value.paymentFrequency
          : paymentFrequency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BondDetailImpl implements _BondDetail {
  const _$BondDetailImpl(
      {required this.bondId,
      required this.bondName,
      required this.isin,
      required this.faceValue,
      required this.currentPrice,
      required this.yield,
      required this.maturityDate,
      required this.rating,
      required this.ratingAgency,
      required this.interestRate,
      required this.paymentFrequency});

  factory _$BondDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$BondDetailImplFromJson(json);

  @override
  final String bondId;
  @override
  final String bondName;
  @override
  final String isin;
  @override
  final double faceValue;
  @override
  final double currentPrice;
  @override
  final double yield;
  @override
  final String maturityDate;
  @override
  final String rating;
  @override
  final String ratingAgency;
  @override
  final double interestRate;
  @override
  final String paymentFrequency;

  @override
  String toString() {
    return 'BondDetail(bondId: $bondId, bondName: $bondName, isin: $isin, faceValue: $faceValue, currentPrice: $currentPrice, yield: $yield, maturityDate: $maturityDate, rating: $rating, ratingAgency: $ratingAgency, interestRate: $interestRate, paymentFrequency: $paymentFrequency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BondDetailImpl &&
            (identical(other.bondId, bondId) || other.bondId == bondId) &&
            (identical(other.bondName, bondName) ||
                other.bondName == bondName) &&
            (identical(other.isin, isin) || other.isin == isin) &&
            (identical(other.faceValue, faceValue) ||
                other.faceValue == faceValue) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.yield, yield) || other.yield == yield) &&
            (identical(other.maturityDate, maturityDate) ||
                other.maturityDate == maturityDate) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ratingAgency, ratingAgency) ||
                other.ratingAgency == ratingAgency) &&
            (identical(other.interestRate, interestRate) ||
                other.interestRate == interestRate) &&
            (identical(other.paymentFrequency, paymentFrequency) ||
                other.paymentFrequency == paymentFrequency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bondId,
      bondName,
      isin,
      faceValue,
      currentPrice,
      yield,
      maturityDate,
      rating,
      ratingAgency,
      interestRate,
      paymentFrequency);

  /// Create a copy of BondDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BondDetailImplCopyWith<_$BondDetailImpl> get copyWith =>
      __$$BondDetailImplCopyWithImpl<_$BondDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BondDetailImplToJson(
      this,
    );
  }
}

abstract class _BondDetail implements BondDetail {
  const factory _BondDetail(
      {required final String bondId,
      required final String bondName,
      required final String isin,
      required final double faceValue,
      required final double currentPrice,
      required final double yield,
      required final String maturityDate,
      required final String rating,
      required final String ratingAgency,
      required final double interestRate,
      required final String paymentFrequency}) = _$BondDetailImpl;

  factory _BondDetail.fromJson(Map<String, dynamic> json) =
      _$BondDetailImpl.fromJson;

  @override
  String get bondId;
  @override
  String get bondName;
  @override
  String get isin;
  @override
  double get faceValue;
  @override
  double get currentPrice;
  @override
  double get yield;
  @override
  String get maturityDate;
  @override
  String get rating;
  @override
  String get ratingAgency;
  @override
  double get interestRate;
  @override
  String get paymentFrequency;

  /// Create a copy of BondDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BondDetailImplCopyWith<_$BondDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CompanyFinancials _$CompanyFinancialsFromJson(Map<String, dynamic> json) {
  return _CompanyFinancials.fromJson(json);
}

/// @nodoc
mixin _$CompanyFinancials {
  double get revenue => throw _privateConstructorUsedError;
  double get profit => throw _privateConstructorUsedError;
  double get debt => throw _privateConstructorUsedError;
  double get equity => throw _privateConstructorUsedError;
  double get roa => throw _privateConstructorUsedError;
  double get roe => throw _privateConstructorUsedError;
  double get eps => throw _privateConstructorUsedError;
  double get peRatio => throw _privateConstructorUsedError;

  /// Serializes this CompanyFinancials to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompanyFinancials
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompanyFinancialsCopyWith<CompanyFinancials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyFinancialsCopyWith<$Res> {
  factory $CompanyFinancialsCopyWith(
          CompanyFinancials value, $Res Function(CompanyFinancials) then) =
      _$CompanyFinancialsCopyWithImpl<$Res, CompanyFinancials>;
  @useResult
  $Res call(
      {double revenue,
      double profit,
      double debt,
      double equity,
      double roa,
      double roe,
      double eps,
      double peRatio});
}

/// @nodoc
class _$CompanyFinancialsCopyWithImpl<$Res, $Val extends CompanyFinancials>
    implements $CompanyFinancialsCopyWith<$Res> {
  _$CompanyFinancialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompanyFinancials
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? revenue = null,
    Object? profit = null,
    Object? debt = null,
    Object? equity = null,
    Object? roa = null,
    Object? roe = null,
    Object? eps = null,
    Object? peRatio = null,
  }) {
    return _then(_value.copyWith(
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      debt: null == debt
          ? _value.debt
          : debt // ignore: cast_nullable_to_non_nullable
              as double,
      equity: null == equity
          ? _value.equity
          : equity // ignore: cast_nullable_to_non_nullable
              as double,
      roa: null == roa
          ? _value.roa
          : roa // ignore: cast_nullable_to_non_nullable
              as double,
      roe: null == roe
          ? _value.roe
          : roe // ignore: cast_nullable_to_non_nullable
              as double,
      eps: null == eps
          ? _value.eps
          : eps // ignore: cast_nullable_to_non_nullable
              as double,
      peRatio: null == peRatio
          ? _value.peRatio
          : peRatio // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyFinancialsImplCopyWith<$Res>
    implements $CompanyFinancialsCopyWith<$Res> {
  factory _$$CompanyFinancialsImplCopyWith(_$CompanyFinancialsImpl value,
          $Res Function(_$CompanyFinancialsImpl) then) =
      __$$CompanyFinancialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double revenue,
      double profit,
      double debt,
      double equity,
      double roa,
      double roe,
      double eps,
      double peRatio});
}

/// @nodoc
class __$$CompanyFinancialsImplCopyWithImpl<$Res>
    extends _$CompanyFinancialsCopyWithImpl<$Res, _$CompanyFinancialsImpl>
    implements _$$CompanyFinancialsImplCopyWith<$Res> {
  __$$CompanyFinancialsImplCopyWithImpl(_$CompanyFinancialsImpl _value,
      $Res Function(_$CompanyFinancialsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompanyFinancials
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? revenue = null,
    Object? profit = null,
    Object? debt = null,
    Object? equity = null,
    Object? roa = null,
    Object? roe = null,
    Object? eps = null,
    Object? peRatio = null,
  }) {
    return _then(_$CompanyFinancialsImpl(
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      debt: null == debt
          ? _value.debt
          : debt // ignore: cast_nullable_to_non_nullable
              as double,
      equity: null == equity
          ? _value.equity
          : equity // ignore: cast_nullable_to_non_nullable
              as double,
      roa: null == roa
          ? _value.roa
          : roa // ignore: cast_nullable_to_non_nullable
              as double,
      roe: null == roe
          ? _value.roe
          : roe // ignore: cast_nullable_to_non_nullable
              as double,
      eps: null == eps
          ? _value.eps
          : eps // ignore: cast_nullable_to_non_nullable
              as double,
      peRatio: null == peRatio
          ? _value.peRatio
          : peRatio // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyFinancialsImpl implements _CompanyFinancials {
  const _$CompanyFinancialsImpl(
      {required this.revenue,
      required this.profit,
      required this.debt,
      required this.equity,
      required this.roa,
      required this.roe,
      required this.eps,
      required this.peRatio});

  factory _$CompanyFinancialsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyFinancialsImplFromJson(json);

  @override
  final double revenue;
  @override
  final double profit;
  @override
  final double debt;
  @override
  final double equity;
  @override
  final double roa;
  @override
  final double roe;
  @override
  final double eps;
  @override
  final double peRatio;

  @override
  String toString() {
    return 'CompanyFinancials(revenue: $revenue, profit: $profit, debt: $debt, equity: $equity, roa: $roa, roe: $roe, eps: $eps, peRatio: $peRatio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyFinancialsImpl &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.debt, debt) || other.debt == debt) &&
            (identical(other.equity, equity) || other.equity == equity) &&
            (identical(other.roa, roa) || other.roa == roa) &&
            (identical(other.roe, roe) || other.roe == roe) &&
            (identical(other.eps, eps) || other.eps == eps) &&
            (identical(other.peRatio, peRatio) || other.peRatio == peRatio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, revenue, profit, debt, equity, roa, roe, eps, peRatio);

  /// Create a copy of CompanyFinancials
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyFinancialsImplCopyWith<_$CompanyFinancialsImpl> get copyWith =>
      __$$CompanyFinancialsImplCopyWithImpl<_$CompanyFinancialsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyFinancialsImplToJson(
      this,
    );
  }
}

abstract class _CompanyFinancials implements CompanyFinancials {
  const factory _CompanyFinancials(
      {required final double revenue,
      required final double profit,
      required final double debt,
      required final double equity,
      required final double roa,
      required final double roe,
      required final double eps,
      required final double peRatio}) = _$CompanyFinancialsImpl;

  factory _CompanyFinancials.fromJson(Map<String, dynamic> json) =
      _$CompanyFinancialsImpl.fromJson;

  @override
  double get revenue;
  @override
  double get profit;
  @override
  double get debt;
  @override
  double get equity;
  @override
  double get roa;
  @override
  double get roe;
  @override
  double get eps;
  @override
  double get peRatio;

  /// Create a copy of CompanyFinancials
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyFinancialsImplCopyWith<_$CompanyFinancialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
