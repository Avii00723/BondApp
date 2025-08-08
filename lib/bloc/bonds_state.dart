import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/bond_search_model.dart';

part 'bonds_state.freezed.dart';

@freezed
class BondsState with _$BondsState {
  const factory BondsState.initial() = BondsInitial;

  const factory BondsState.loading() = BondsLoading;

  const factory BondsState.searchResults({
    required List<BondSearchModel> results,
    required String query,
  }) = BondsSearchResults;

  const factory BondsState.suggestedResults({
    required List<BondSearchModel> suggestions,
  }) = BondsSuggestedResults;

  const factory BondsState.bondDetailLoading({
    required String isin,
  }) = BondDetailLoading;

  const factory BondsState.bondDetailLoaded({
    required BondDetailModel bondDetail,
  }) = BondDetailLoaded;

  const factory BondsState.error({
    required String message,
  }) = BondsError;
}