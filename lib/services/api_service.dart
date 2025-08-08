import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  static const String _bondsListUrl = 'https://eol122duf9sy4de.m.pipedream.net';
  static const String _bondDetailUrl = 'https://eo61q3zd4heiwke.m.pipedream.net';

  final http.Client _client;

  ApiService() : _client = http.Client();

  Future<Map<String, dynamic>> getBondsList() async {
    try {
      final response = await _client.get(
        Uri.parse(_bondsListUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 15));

      print('📡 Bonds List API Response: ${response.statusCode}');
      print('📦 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data as Map<String, dynamic>;
      } else {
        print('❌ API Error: ${response.statusCode} - ${response.body}');
        throw ApiException('Failed to load bonds: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      print('❌ Network Error: ${e.message}');
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      print('❌ Unexpected Error: $e');
      if (e is ApiException || e is NetworkException) rethrow;
      print('🔄 Using fallback mock data');
      return _getMockBondsList();
    }
  }

  Future<Map<String, dynamic>> getBondDetail(String isin) async {
    try {
      final response = await _client.post(
        Uri.parse(_bondDetailUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({'isin': isin}),
      ).timeout(const Duration(seconds: 15));

      print('📡 Bond Detail API Response: ${response.statusCode}');
      print('📦 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data as Map<String, dynamic>;
      } else {
        print('❌ API Error: ${response.statusCode} - ${response.body}');
        throw ApiException('Failed to load bond detail: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      print('❌ Network Error: ${e.message}');
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      print('❌ Unexpected Error: $e');
      if (e is ApiException || e is NetworkException) rethrow;
      // Fallback to mock data
      print('🔄 Using fallback mock data for ISIN: $isin');
      return _getMockBondDetail(isin);
    }
  }

  Future<List<Map<String, dynamic>>> searchBonds(String query) async {
    try {
      // Get all bonds first
      final allBondsResponse = await getBondsList();
      final List<dynamic> allBonds = allBondsResponse['data'] ?? [];

      print('🔍 Searching for: "$query"');
      print('🔍 Total bonds to search: ${allBonds.length}');

      final filteredBonds = allBonds.where((bond) {
        return _matchesSearchQuery(bond, query);
      }).toList();

      print('🔍 Found ${filteredBonds.length} matching bonds');

      return filteredBonds.cast<Map<String, dynamic>>();
    } catch (e) {
      print('❌ Search Error: $e');
      return _getMockSearchResults(query);
    }
  }

  bool _matchesSearchQuery(dynamic bond, String query) {
    if (query.isEmpty) return true;

    // Get searchable fields
    final isin = (bond['isin'] ?? '').toString().toLowerCase();
    final companyName = (bond['company_name'] ?? '').toString().toLowerCase();
    final rating = (bond['rating'] ?? '').toString().toLowerCase();
    final tags = (bond['tags'] as List<dynamic>?)
        ?.map((tag) => tag.toString().toLowerCase())
        .join(' ') ?? '';

    final searchableText = '$isin $companyName $rating $tags';

    final keywords = query.toLowerCase().trim().split(RegExp(r'\s+'))
        .where((keyword) => keyword.isNotEmpty)
        .toList();

    print('🔍 Keywords: $keywords');
    print('🔍 Checking bond: ${bond['isin']} - ${bond['company_name']}');
    print('🔍 Searchable text: "$searchableText"');

    final matches = keywords.every((keyword) =>
        searchableText.contains(keyword));

    if (matches) {
      print('✅ Match found for: ${bond['isin']} - ${bond['company_name']}');
    } else {
      print('❌ No match for: ${bond['isin']} - ${bond['company_name']}');
    }

    return matches;
  }

  Map<String, dynamic> _getMockBondsList() {
    return {
      "data": [
        {
          "logo": "https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B",
          "isin": "INE06E501754",
          "rating": "AAA",
          "company_name": "Hella Chemical Market Private Limited",
          "tags": ["Hella"]
        },
        {
          "logo": "https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B",
          "isin": "INE06E502345",
          "rating": "AAA",
          "company_name": "Hella Chemical Market Private Limited",
          "tags": ["Hella"]
        },
        {
          "logo": "https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B",
          "isin": "INE06E508653",
          "rating": "AAA",
          "company_name": "Hella Chemical Market Private Limited",
          "tags": ["Hella"]
        },
        {
          "logo": "https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B",
          "isin": "INE06E509123",
          "rating": "AA+",
          "company_name": "Infra Steel Industries Ltd.",
          "tags": ["Infra", "Steel"]
        },
        {
          "logo": "https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B",
          "isin": "INE06E503678",
          "rating": "A",
          "company_name": "Green Energy Solutions Pvt Ltd",
          "tags": ["Green", "Energy"]
        }
      ]
    };
  }

  List<Map<String, dynamic>> _getMockSearchResults(String query) {
    final allMockData = _getMockBondsList()['data'] as List<dynamic>;

    print('🔄 Using mock search for query: "$query"');

    return allMockData.where((bond) {
      return _matchesSearchQuery(bond, query);
    }).cast<Map<String, dynamic>>().toList();
  }

  Map<String, dynamic> _getMockBondDetail(String isin) {
    return {
      "logo": "https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B",
      "company_name": "Hella Infra Private Limited",
      "description": "Hella Infra is a construction materials platform that enhances operational efficiency by integrating technology into the construction industry's value chain.",
      "isin": isin,
      "status": "ACTIVE",
      "pros_and_cons": {
        "pros": [
          "Majority GoI ownership marked with demonstrated government support and strong integration with the parent",
          "Strategic role in providing financial assistance to meet planned outlay of IR",
          "Strong asset quality considering entire exposure to MoR / MoR-owned entities",
          "Healthy capitalisation profile",
          "Diversified borrowings profile",
          "Liquidity: Adequate"
        ],
        "cons": [
          "Moderate profitability metrics",
          "High concentration risk"
        ]
      },
      "financials": {
        "ebitda": [
          {"month": "Jan", "value": 12000000.0},
          {"month": "Feb", "value": 13500000.0},
          {"month": "Mar", "value": 11800000.0},
          {"month": "Apr", "value": 14500000.0},
          {"month": "May", "value": 12800000.0},
          {"month": "Jun", "value": 15500000.0},
          {"month": "Jul", "value": 13200000.0},
          {"month": "Aug", "value": 14800000.0},
          {"month": "Sep", "value": 13700000.0},
          {"month": "Oct", "value": 16000000.0},
          {"month": "Nov", "value": 12500000.0},
          {"month": "Dec", "value": 14000000.0}
        ],
        "revenue": [
          {"month": "Jan", "value": 25000000.0},
          {"month": "Feb", "value": 26500000.0},
          {"month": "Mar", "value": 24500000.0},
          {"month": "Apr", "value": 27800000.0},
          {"month": "May", "value": 26000000.0},
          {"month": "Jun", "value": 29000000.0},
          {"month": "Jul", "value": 27500000.0},
          {"month": "Aug", "value": 28500000.0},
          {"month": "Sep", "value": 27000000.0},
          {"month": "Oct", "value": 30000000.0},
          {"month": "Nov", "value": 25500000.0},
          {"month": "Dec", "value": 29500000.0}
        ]
      },
      "issuer_details": {
        "issuer_name": "TRUE CREDITS PRIVATE LIMITED",
        "type_of_issuer": "Non PSU",
        "sector": "Financial Services",
        "industry": "Finance",
        "issuer_nature": "NBFC",
        "cin": "U65190HR2017PTC070653",
        "lead_manager": "-",
        "registrar": "KFIN TECHNOLOGIES PRIVATE LIMITED",
        "debenture_trustee": "IDBI Trusteeship Services Limited"
      }
    };
  }

  void dispose() {
    _client.close();
  }
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => 'ApiException: $message';
}

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}