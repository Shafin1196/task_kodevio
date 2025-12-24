import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod/legacy.dart';
import 'package:task_kodevio/models/user.dart';
import 'package:task_kodevio/models/state_provider.dart';

final listProviderNotifierProvider = StateNotifierProvider<ListProviderNotifier, ListProviderState>(
  (ref) => ListProviderNotifier()..fetchUsers()
);

class ListProviderNotifier extends StateNotifier<ListProviderState> {
  ListProviderNotifier()
      : super(ListProviderState(
          users: [],
          isDarkMode: false,
          filteredUsers: [],
          search: '',
          errorMessage: '',
        ));

  Future<void> fetchUsers() async {
    try {
      final url = "https://jsonplaceholder.typicode.com/users";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
        final users = User.fromJsonList(data);
        state = state.copyWith(
          users: users,
          filteredUsers: users,
        );
      } else {
        state = state.copyWith(
          errorMessage: 'Failed to load users: ${response.statusCode}',
        );
      }
    } catch (error) {
      state = state.copyWith(
        errorMessage: 'An error occurred: $error',
      );
    }
  }
  void setSearch(String value) {
    final filtered = state.users
        .where((user) => user.name?.toLowerCase().contains(value.toLowerCase()) ?? false)
        .toList();
    state = state.copyWith(
      search: value,
      filteredUsers: filtered,
    );
  }
  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
}

