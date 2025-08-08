import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../repositories/bonds_repositories.dart';
import 'bonds_event.dart';
import 'bonds_state.dart';

@injectable
class BondsBloc extends Bloc<BondsEvent, BondsState> {
  final BondsRepository _repository;

  BondsBloc(this._repository) : super(const BondsState.initial()) {
    on<LoadSuggestedBondsEvent>(_onLoadSuggestedBonds);
    on<SearchBondsEvent>(_onSearchBonds);
    on<LoadBondDetailEvent>(_onLoadBondDetail);
    on<ClearSearchEvent>(_onClearSearch);
  }

  Future<void> _onLoadSuggestedBonds(
      LoadSuggestedBondsEvent event,
      Emitter<BondsState> emit,
      ) async {
    emit(const BondsState.loading());

    try {
      final suggestions = await _repository.fetchSuggestedBonds();
      emit(BondsState.suggestedResults(suggestions: suggestions));
    } catch (e) {
      emit(BondsState.error(message: e.toString()));
    }
  }

  Future<void> _onSearchBonds(
      SearchBondsEvent event,
      Emitter<BondsState> emit,
      ) async {
    if (event.query.isEmpty) {
      add(const LoadSuggestedBondsEvent());
      return;
    }

    emit(const BondsState.loading());

    try {
      final results = await _repository.searchBonds(event.query);
      emit(BondsState.searchResults(results: results, query: event.query));
    } catch (e) {
      emit(BondsState.error(message: e.toString()));
    }
  }

  Future<void> _onLoadBondDetail(
      LoadBondDetailEvent event,
      Emitter<BondsState> emit,
      ) async {
    emit(BondsState.bondDetailLoading(isin: event.isin));

    try {
      final bondDetail = await _repository.fetchBondDetail(event.isin);
      emit(BondsState.bondDetailLoaded(bondDetail: bondDetail));
    } catch (e) {
      emit(BondsState.error(message: e.toString()));
    }
  }

  void _onClearSearch(
      ClearSearchEvent event,
      Emitter<BondsState> emit,
      ) {
    add(const LoadSuggestedBondsEvent());
  }
}