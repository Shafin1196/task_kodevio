import 'package:task_kodevio/models/user.dart';

class ListProviderState{
  final List<User> users;
  final bool isDarkMode;
  final List<User>filteredUsers;
  final String search;
  final String errorMessage;
  ListProviderState({
    required this.users,
    required this.isDarkMode,
    required this.filteredUsers,
    required this.search,
    required this.errorMessage,
  });

  ListProviderState copyWith({
    List<User>? users,
    bool? isDarkMode,
    List<User>? filteredUsers,
    String? search,
    String? errorMessage,
  }){
    return ListProviderState(
      users: users ?? this.users,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      filteredUsers: filteredUsers ?? this.filteredUsers,
      search: search ?? this.search,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

}