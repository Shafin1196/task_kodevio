import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_kodevio/providers/list_provider.dart';
import 'package:task_kodevio/screens/userDetails.dart';


class UsersList extends ConsumerStatefulWidget {
  const UsersList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UsersListState();
}

class _UsersListState extends ConsumerState<UsersList> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(listProviderNotifierProvider);
          if (state.errorMessage!='') {
            return Center(child: Text(state.errorMessage));
          }
          if (state.users.isEmpty && state.search.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.filteredUsers.isEmpty) {
            if (state.search.isNotEmpty) {
              return const Center(child: Text('No users found for your search.'));
            } else {
              return const Center(child: Text('No users found.'));
            }
          }
          return RefreshIndicator(
            elevation: 10,
            onRefresh: ()async{
              await ref.read(listProviderNotifierProvider.notifier).fetchUsers();
            },
            child: ListView.builder(
              itemCount: state.filteredUsers.length,
              itemBuilder: (context, index) {
                final user = state.filteredUsers[index];
                return ListTile(
                  title: Text(user.name ?? 'N/A'),
                  subtitle: Text(user.email ?? 'N/A'),
                  trailing: Text(user.company?.name??'N/A'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Userdetails(user: user),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
          
  }
}