import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Database'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: Hive.openBox('nisha'),
            builder: (context,snapshot) {
              return Column(
                children: [
                //   ListTile(
                //     title:snapshot.data!.get('name')== null ? Text('no data') : Text(snapshot.data!.get('name').toString()),
                //     subtitle: Text(snapshot.data!.get('age').toString()),
                //     trailing: IconButton(
                //       onPressed: () {
                //         snapshot.data!.put('name', 'nisha');
                //         snapshot.data!.put('age', '25');
                //         setState(() {
                //
                //         });
                //       },
                //       icon: Icon(Icons.edit),
                //    ),
                //   ),
                //   SizedBox(height: 20,),
                //   Text(snapshot.data!.get('details').toString()),
                //   // Text(snapshot.data!.get('details')['student'].toString()),
                ],
              );

            }

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          // var box = await Hive.openBox('nisha');
          //
          // box.put('name', 'Nisha Patel');
          // box.put('age', 21);
          // box.put('details', {
          //   'student' : 'IT',
          //   'flutter' : 'developer',
          // });
          //
          // print(box.get('name'));
          // print(box.get('age'));
          // print(box.get('details'));
          // print(box.get('details')['student']);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

