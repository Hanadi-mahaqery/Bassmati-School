import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:school_app/services/auth_services.dart';

class ApiService {
  final String _baseUrl = 'http://192.168.177.81:5257/api/Login';
  final AuthService _authService = AuthService();

  Future<void> fetchData() async {
    final token = await _authService.getToken();
    if (token == null) {
      throw Exception('No token found');
    }

    final url = Uri.parse('$_baseUrl/protected-endpoint');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // معالجة البيانات المستلمة من الخادم
      final data = jsonDecode(response.body);
      print(data);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
