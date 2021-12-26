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
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SizedBox(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PageRoute(key: widget.key),
              ),
            );
          },
          child: Hero(
            tag: "tag",
            child: ClipRect(
              child: Image.network(
                "https://i.pinimg.com/236x/58/70/6f/58706fbb9c604512a9555134200205d8.jpg",
                width: 200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PageRoute extends StatelessWidget {
  @override
  const PageRoute({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: 'tag',
        child: Image.network(
            'https://i.pinimg.com/236x/58/70/6f/58706fbb9c604512a9555134200205d8.jpg'),
      ),
    );
  }
}
