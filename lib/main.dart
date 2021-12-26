import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = "Modify Title GitHub Demo";
  @override
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primaryColor: Colors.indigo),
      home: const MainPage(title: title),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  const MainPage({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: false,
            floating: false,
            title: Center(child: Text("Map")),
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Map"),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Text(
                  "Sliver",
                  style: TextStyle(fontSize: 600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
