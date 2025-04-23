import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/src/client.dart';
import 'package:eatelo/models/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserApi {
  final String baseurl = dotenv.env['MONGODB_URI'] ?? 'http://localhost:3000';
  final String userEndpoint = '/user';

  final http.Client client;
  UserApi({http.Client? client}) : client = client ?? http.Client();

  Future<http.Response> createUser(User user) async{
    try {
      final http.Response response = await client.post(
        Uri.parse('$baseurl$userEndpoint/register'),
        headers: {'Content-Type':'application/json'},
        body: user.toJson()
      );
      return response;
    } catch (e) {
      throw Exception('failed to update $e');
    }
  }
}