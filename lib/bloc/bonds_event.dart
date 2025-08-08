import 'package:equatable/equatable.dart';

abstract class BondsEvent extends Equatable {
  const BondsEvent();

  @override
  List<Object?> get props => [];
}

class SearchBondsEvent extends BondsEvent {
  final String query;

  const SearchBondsEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class LoadSuggestedBondsEvent extends BondsEvent {
  const LoadSuggestedBondsEvent();
}

class LoadBondDetailEvent extends BondsEvent {
  final String isin;

  const LoadBondDetailEvent(this.isin);

  @override
  List<Object?> get props => [isin];
}

class ClearSearchEvent extends BondsEvent {
  const ClearSearchEvent();
}