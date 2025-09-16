import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabs Demo',
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tabs Demo'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
                Tab(text: 'Tab 4'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TabOne(),
              TabTwo(),
              TabThree(),
              TabFour(),
            ],
          ),
         
          // Bottom App Bar with quick nav buttons 
          bottomNavigationBar: Builder(
            builder: (context) => BottomAppBar(
              child: Row(
                children: [
                  IconButton(
                    tooltip: 'Go to Tab 1',
                    icon: const Icon(Icons.text_fields),
                    onPressed: () => DefaultTabController.of(context).animateTo(0),
                  ),
                  IconButton(
                    tooltip: 'Go to Tab 2',
                    icon: const Icon(Icons.image),
                    onPressed: () => DefaultTabController.of(context).animateTo(1),
                  ),
                  const Spacer(),
                  IconButton(
                    tooltip: 'Go to Tab 3',
                    icon: const Icon(Icons.touch_app),
                    onPressed: () => DefaultTabController.of(context).animateTo(2),
                  ),
                  IconButton(
                    tooltip: 'Go to Tab 4',
                    icon: const Icon(Icons.list),
                    onPressed: () => DefaultTabController.of(context).animateTo(3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ---------------- Tab 1 ----------------
/// Text + AlertDialog
class TabOne extends StatelessWidget {
  const TabOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade50,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1706694668166-d09c91016064?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            width: 400,
            height: 400,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

/// ---------------- Tab 2 ----------------
/// TextFields + Image.network
class TabTwo extends StatelessWidget {
  const TabTwo({super.key});

  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade50,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1613520414185-078c05edb341?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            width: 400,
            height: 400,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

///Noah ---------------- Tab 3 ----------------
// Stormy Weather Image 
class TabThree extends StatelessWidget {
  const TabThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade50,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1605035015406-54c130d0bf89?q=80&w=3132&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

/// Noah---------------- Tab 4 ----------------
/// ListView + Cards
class TabFour extends StatelessWidget {
  const TabFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade50,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1702355520244-42f5344aec37?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

