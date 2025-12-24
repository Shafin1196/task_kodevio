import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_kodevio/models/user.dart';
import 'package:task_kodevio/providers/buttonProviders.dart';
import 'package:task_kodevio/providers/futureProvider.dart';
import 'package:task_kodevio/screens/userDetails.dart';

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
          IconButton(onPressed: (){
            ref.read(lightDark.notifier).state=!ref.read(lightDark.notifier).state;
          }, 
          icon: Icon(ref.watch(lightDark)?Icons.light_mode:Icons.dark_mode),
          )
        ],
      
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search by name',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // ref.read(searchProvider.notifier).state = value;
              },
            ),
            Expanded(
              child: Consumer(builder: (context,ref,child){
                        final userList=ref.watch( userListProvider);
                        return userList.when(
              data: (data) => RefreshIndicator(
                onRefresh: ()async{
                  ref.refresh(userListProvider.future);
                },
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final User user = data[index];
                    return ListTile(
                      onTap: ()=>Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx)=>Userdetails(user: user))
                        ),
                      title: Text(user.name!),
                      subtitle: Text(user.email!),
                      leading:  SizedBox(
                        width: 70,
                        child: Text(
                          user.company!.name!,
                          overflow: TextOverflow.ellipsis,
                        )
                        ),
                      
                    );
                  },
                ),
              ),
              error: (error,stack)=> Center(
                child: Text('Error: $error'),
              ),
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
              );
                      }),
            )
          ],
        )
        ),
    );
  }
}