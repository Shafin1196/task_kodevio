import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_kodevio/models/user.dart';

class UserService {
  /// Fetches a list of users from [url] and returns a `List<User>`.
  /// Defaults to the JSONPlaceholder users endpoint.
  static Future<List<User>> fetchUsers({
    String url = 'https://jsonplaceholder.typicode.com/users',
  }) async {
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      final List<dynamic> data = jsonDecode(res.body) as List<dynamic>;
      return data
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load users: ${res.statusCode}');
    }
  }
}
