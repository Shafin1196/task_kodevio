import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_kodevio/providers/list_provider.dart';
import 'package:task_kodevio/widgets/usersList.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(listProviderNotifierProvider.notifier).toggleDarkMode();
            },
            icon: Icon(
              ref.watch(listProviderNotifierProvider).isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search Users',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      ref
                          .read(listProviderNotifierProvider.notifier)
                          .setSearch(value);
                    },
                  ),
                );
              },
            ),
            UsersList(),
          ],
        ),
      ),
    );
  }
}
