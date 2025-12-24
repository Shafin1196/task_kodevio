import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import 'package:task_kodevio/models/user.dart';

final userListProvider = FutureProvider<List<User>>((ref) async {
  try {
    var url = "https://jsonplaceholder.typicode.com/users";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
      return User.fromJsonList(data);
    } else {
      throw Exception('Failed to load users: ${response.statusCode}');
    }
  } catch (error) {
    throw error;
  }
});
