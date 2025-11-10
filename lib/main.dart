import 'package:drawer_animation/colors.dart';
import 'package:drawer_animation/extensions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final double drawerWidth = context.width * 0.4;
  late final double statusBarHeight = MediaQuery.of(context).padding.top;
  final appBarHeight = kToolbarHeight;

  bool isDrawerOpen = false;
  final duration = Duration(milliseconds: 246);
  int selectedIndex = 0;
  final pages = [FirstPage(), SecondPage(), ThirdPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(title: const Text('Drawer menu animation'), backgroundColor: lightGreen),
      onDrawerChanged: (isOpen) => setState(() => isDrawerOpen = isOpen),
      drawer: Padding(
        padding: EdgeInsets.only(top: statusBarHeight + appBarHeight),
        child: Drawer(
          width: drawerWidth,
          backgroundColor: green,
          child: ListView(
            padding: EdgeInsets.only(),
            children: [
              ...List.generate(
                (3),
                (index) => ListTile(
                  title: Text('Page ${index + 1}'),
                  onTap: () => setState(() => selectedIndex = index),
                  selected: index == selectedIndex,
                  selectedTileColor: brown,
                  textColor: Colors.white,
                  selectedColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      drawerScrimColor: Colors.transparent,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: duration,
            left: isDrawerOpen ? drawerWidth : 0,
            bottom: 0,
            top: 0,
            width: context.width,
            child: AnimatedScale(
              duration: duration,
              scale: isDrawerOpen ? 0.85 : 1,
              child: AnimatedContainer(
                duration: duration,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: isDrawerOpen ? BorderRadius.circular(40) : null,
                ),
                child: pages[selectedIndex],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text('First Page', style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text('Second Page', style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text('Third Page', style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
