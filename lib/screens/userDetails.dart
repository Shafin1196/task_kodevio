import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_kodevio/models/user.dart';
class Userdetails extends ConsumerStatefulWidget {
  const Userdetails({super.key, required this.user});
  final User user;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserdetailsState();
}

class _UserdetailsState extends ConsumerState<Userdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.user.name} Details',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${widget.user.name}'),
            Text('Username: ${widget.user.username}'),
            Text('Email: ${widget.user.email}'),
            Text('Phone: ${widget.user.phone}'),
            Text('Website: ${widget.user.website}'),
            Text(
              'Address: ${widget.user.address!.street}, ${widget.user.address!.suite}, ${widget.user.address!.city}, ${widget.user.address!.zipcode}',
            ),
          ],
        ),
      ),
    );
  }
}
