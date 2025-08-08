import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bonds_bloc.dart';
import '../bloc/bonds_event.dart';
import '../bloc/bonds_state.dart';
import '../injection/injection_config.dart';
import '../models/bond_search_model.dart';
import '../widgets/bonds_search_card.dart';
import '../widgets/error_widget.dart';
import '../widgets/loading_widget.dart';
import '../services/haptic_service.dart'; // Import the haptic service
import 'bond_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BondsBloc>()..add(const LoadSuggestedBondsEvent()),
      child: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatefulWidget {
  const _HomeScreenView();

  @override
  State<_HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<_HomeScreenView> with RouteAware {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  bool _hasNavigatedToDetail = false;

  // Cache the last successful state
  List<BondSearchModel>? _cachedSuggestions;
  List<BondSearchModel>? _cachedSearchResults;
  String? _cachedSearchQuery;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
    // Initialize haptic service
    _initializeHaptics();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchTextChanged);
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _initializeHaptics() async {
    await HapticService.initialize();
  }

  void _onSearchTextChanged() {
    final value = _searchController.text;
    setState(() {
      _isSearching = value.isNotEmpty;
    });
  }

  void _handleReturnFromDetail() {
    if (_hasNavigatedToDetail) {
      _hasNavigatedToDetail = false;

      HapticService.lightImpact();

      if (_isSearching && _searchController.text.isNotEmpty) {
        if (_cachedSearchResults != null && _cachedSearchQuery == _searchController.text) {
          return;
        } else {
          context.read<BondsBloc>().add(SearchBondsEvent(_searchController.text));
        }
      } else {
        if (_cachedSuggestions != null) {
          return;
        } else {
          context.read<BondsBloc>().add(const LoadSuggestedBondsEvent());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),

      ),
      body: BlocConsumer<BondsBloc, BondsState>(
        listener: (context, state) {
          if (state is BondDetailLoaded) {
            _hasNavigatedToDetail = true;

            // Enhanced haptic feedback for successful bond detail load
            HapticService.bondDetailLoaded();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BondDetailScreen(bondDetail: state.bondDetail),
              ),
            ).then((_) {
              _handleReturnFromDetail();
            });
          } else if (state is BondsError) {
            // Enhanced error haptic feedback
            HapticService.bondApiError();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          } else if (state is BondsSearchResults) {
            _cachedSearchResults = List.from(state.results);
            _cachedSearchQuery = state.query;

            // Enhanced haptic feedback for successful search
            HapticService.dataLoadSuccess();
          } else if (state is BondsSuggestedResults) {
            _cachedSuggestions = List.from(state.suggestions);

            // Enhanced haptic feedback for suggestions loaded
            HapticService.dataLoadSuccess();
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              _buildSearchBar(),
              Expanded(
                child: _buildBody(state),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(BondsState state) {
    if (state is BondsInitial) {
      if (_cachedSuggestions != null && !_isSearching) {
        return _buildResultsList(_cachedSuggestions!, 'SUGGESTED RESULTS');
      } else if (_cachedSearchResults != null && _isSearching && _cachedSearchQuery == _searchController.text) {
        return _buildResultsList(_cachedSearchResults!, 'SEARCH RESULTS', query: _cachedSearchQuery);
      }
      return const LoadingWidget(message: 'Initializing...');
    } else if (state is BondsLoading) {
      if (_cachedSuggestions != null && !_isSearching) {
        return _buildResultsList(_cachedSuggestions!, 'SUGGESTED RESULTS');
      } else if (_cachedSearchResults != null && _isSearching && _cachedSearchQuery == _searchController.text) {
        return _buildResultsList(_cachedSearchResults!, 'SEARCH RESULTS', query: _cachedSearchQuery);
      }
      return const LoadingWidget(message: 'Loading bonds...');
    } else if (state is BondsSuggestedResults) {
      return _buildResultsList(state.suggestions, 'SUGGESTED RESULTS');
    } else if (state is BondsSearchResults) {
      return _buildResultsList(state.results, 'SEARCH RESULTS', query: state.query);
    } else if (state is BondDetailLoading) {
      if (_cachedSuggestions != null && !_isSearching) {
        return _buildResultsList(_cachedSuggestions!, 'SUGGESTED RESULTS');
      } else if (_cachedSearchResults != null && _isSearching) {
        return _buildResultsList(_cachedSearchResults!, 'SEARCH RESULTS', query: _cachedSearchQuery);
      }
      return const LoadingWidget(message: 'Loading bond details...');
    } else if (state is BondDetailLoaded) {
      if (_cachedSuggestions != null && !_isSearching) {
        return _buildResultsList(_cachedSuggestions!, 'SUGGESTED RESULTS');
      } else if (_cachedSearchResults != null && _isSearching) {
        return _buildResultsList(_cachedSearchResults!, 'SEARCH RESULTS', query: _cachedSearchQuery);
      }
      return _buildResultsList([], 'SEARCH RESULTS');
    } else if (state is BondsError) {
      return ErrorDisplayWidget(
        message: state.message,
        onRetry: () {
          // Enhanced haptic feedback on retry
          HapticService.mediumImpact();
          if (_isSearching && _searchController.text.isNotEmpty) {
            context.read<BondsBloc>().add(SearchBondsEvent(_searchController.text));
          } else {
            context.read<BondsBloc>().add(const LoadSuggestedBondsEvent());
          }
        },
      );
    }

    if (_cachedSuggestions != null && !_isSearching) {
      return _buildResultsList(_cachedSuggestions!, 'SUGGESTED RESULTS');
    } else if (_cachedSearchResults != null && _isSearching) {
      return _buildResultsList(_cachedSearchResults!, 'SEARCH RESULTS', query: _cachedSearchQuery);
    }

    return const LoadingWidget();
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          if (value.isEmpty) {
            HapticService.searchCleared();
            context.read<BondsBloc>().add(const ClearSearchEvent());
          } else {
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted && _searchController.text == value && value.isNotEmpty) {
                // Enhanced haptic feedback when performing search
                HapticService.bondSearch();
                context.read<BondsBloc>().add(SearchBondsEvent(value));
              }
            });
          }
        },
        onTap: () {
          HapticService.lightSelection();
        },
        decoration: InputDecoration(
          hintText: 'Search by Issuer Name or ISIN',
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 16,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[400],
          ),
          suffixIcon: _isSearching
              ? IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.grey[400],
            ),
            onPressed: () {
              // Enhanced haptic feedback when clearing search
              HapticService.searchCleared();
              _searchController.clear();
              context.read<BondsBloc>().add(const ClearSearchEvent());
            },
          )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildResultsList(List<BondSearchModel> bonds, String title, {String? query}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                  letterSpacing: 0.5,
                ),
              ),
              if (query != null) ...[
                const SizedBox(width: 8),
                Text(
                  '(${bonds.length} results for "$query")',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: bonds.isEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_off,
                  size: 64,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  query != null
                      ? 'No results found for "$query"'
                      : 'No bonds available',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                if (query != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Try searching with different keywords',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ],
            ),
          )
              : RefreshIndicator(
            onRefresh: () async {
              // Enhanced haptic feedback for pull-to-refresh
              await HapticService.pullToRefresh();
              if (_isSearching && _searchController.text.isNotEmpty) {
                context.read<BondsBloc>().add(SearchBondsEvent(_searchController.text));
              } else {
                context.read<BondsBloc>().add(const LoadSuggestedBondsEvent());
              }
            },
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: bonds.length,
              itemBuilder: (context, index) {
                final bond = bonds[index];
                return BondSearchCard(
                  bond: bond,
                  searchQuery: query,
                  onTap: () {
                    // Enhanced haptic feedback when tapping on a bond card
                    HapticService.bondCardTap();
                    context.read<BondsBloc>().add(
                      LoadBondDetailEvent(bond.isin),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}