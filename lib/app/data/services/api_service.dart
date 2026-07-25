import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  static const String _baseUrl = 'https://reqres.in/api/users';

  static const String _apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: 'reqres_a29855c5a8134af78bd93d459cf6fc8e',
  );

  Future<UserListResponse> fetchUsers({
    required int page,
    int perPage = 10,
  }) async {
    final uri = Uri.parse('$_baseUrl?page=$page&per_page=$perPage');

    final response = await http.get(
      uri,
      headers: {
        'x-api-key': _apiKey,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonBody =
          json.decode(response.body) as Map<String, dynamic>;
      return UserListResponse.fromJson(jsonBody);
    }

    throw Exception(
      'Failed to load users (status ${response.statusCode}): ${response.body}',
    );
  }
}
// 'free_user_3Gz4BmhWVmJRV339XjNEWZxVYem'