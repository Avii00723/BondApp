import 'package:injectable/injectable.dart';

import '../models/bond_search_model.dart';
import '../services/api_service.dart';

@lazySingleton
class BondsRepository {
  final ApiService _apiService;

  BondsRepository(this._apiService);

  Future<List<BondSearchModel>> fetchSuggestedBonds() async {
    try {
      final response = await _apiService.getBondsList();
      final List<dynamic> data = response['data'] ?? [];

      print('📦 Repository: Processing ${data.length} bonds');

      if (data.isEmpty) {
        throw RepositoryException('No bonds data received from server');
      }

      return data.map((json) {
        try {
          return BondSearchModel.fromJson(json as Map<String, dynamic>);
        } catch (e) {
          print('❌ Error parsing bond: $json - Error: $e');
          throw RepositoryException('Invalid bond data format: $e');
        }
      }).toList();
    } on ApiException catch (e) {
      throw RepositoryException('API Error: ${e.message}');
    } on NetworkException catch (e) {
      throw RepositoryException('Network Error: ${e.message}');
    } catch (e) {
      print('❌ Repository Error: $e');
      throw RepositoryException('Failed to fetch bonds: $e');
    }
  }

  Future<List<BondSearchModel>> searchBonds(String query) async {
    try {
      final searchResults = await _apiService.searchBonds(query);

      print('🔍 Repository: Found ${searchResults.length} results for "$query"');

      return searchResults.map((json) {
        try {
          return BondSearchModel.fromJson(json);
        } catch (e) {
          print('❌ Error parsing search result: $json - Error: $e');
          throw RepositoryException('Invalid search result format: $e');
        }
      }).toList();
    } on ApiException catch (e) {
      throw RepositoryException('API Error: ${e.message}');
    } on NetworkException catch (e) {
      throw RepositoryException('Network Error: ${e.message}');
    } catch (e) {
      print('❌ Repository Search Error: $e');
      throw RepositoryException('Failed to search bonds: $e');
    }
  }

  Future<BondDetailModel> fetchBondDetail(String isin) async {
    try {
      print('📡 Repository: Fetching detail for ISIN: $isin');

      if (isin.isEmpty) {
        throw RepositoryException('ISIN cannot be empty');
      }

      final response = await _apiService.getBondDetail(isin);

      print('📦 Repository: Received bond detail response');

      try {
        return BondDetailModel.fromJson(response);
      } catch (e) {
        print('❌ Error parsing bond detail: $response - Error: $e');
        throw RepositoryException('Invalid bond detail format: $e');
      }
    } on ApiException catch (e) {
      throw RepositoryException('API Error: ${e.message}');
    } on NetworkException catch (e) {
      throw RepositoryException('Network Error: ${e.message}');
    } catch (e) {
      print('❌ Repository Detail Error: $e');
      throw RepositoryException('Failed to fetch bond detail: $e');
    }
  }
}

class RepositoryException implements Exception {
  final String message;

  RepositoryException(this.message);

  @override
  String toString() => 'RepositoryException: $message';
}