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
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: ChoiceChip(
            avatar: Image.network(
                "https://i.pinimg.com/736x/cc/7f/07/cc7f078eaba09f2f7d4e87a727b31c70.jpg"),
            label: const Text("Choice chip"),
            selected: _isSelected,
            onSelected: (newBoolValue) {
              setState(() {
                _isSelected = newBoolValue;
              });
            }),
      ),
    );
  }
}
