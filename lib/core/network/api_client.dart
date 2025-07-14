import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_band/core/helpers/token_storage.dart';

class ApiClient {
  final TokenStorage tokenStorage;

  ApiClient({required this.tokenStorage});

  Future<Map<String, String>> _getHeaders([
    Map<String, String>? customHeaders,
  ]) async {
    final token = await tokenStorage.getToken();

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
      ...?customHeaders,
    };
  }

  Future<http.Response> get({
    required String endpoint,
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse(endpoint);
    return http.get(url, headers: await _getHeaders(headers));
  }

  Future<http.Response> post({
    required String endpoint,
    Map<String, String>? headers,
    Object? body,
  }) async {
    final url = Uri.parse(endpoint);
    return http.post(
      url,
      headers: await _getHeaders(headers),
      body: jsonEncode(body),
    );
  }

  Future<http.Response> put({
    required String endpoint,
    Map<String, String>? headers,
    Object? body,
  }) async {
    final url = Uri.parse(endpoint);
    return http.put(
      url,
      headers: await _getHeaders(headers),
      body: jsonEncode(body),
    );
  }

  Future<http.Response> delete({
    required String endpoint,
    Map<String, String>? headers,
    Object? body,
  }) async {
    final url = Uri.parse(endpoint);
    return http.delete(
      url,
      headers: await _getHeaders(headers),
      body: jsonEncode(body),
    );
  }
}
