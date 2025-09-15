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
          const Text(
            'This is TAB 1',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            'This tab has a styled text and an AlertDialog.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.warning_amber),
            label: const Text('Display Alert Dialog'),
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Alert!'),
                  content: const Text('This button shows an alert when pressed.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade50,
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Name Input and Image',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.network(
                'https://images.unsplash.com/photo-1755397271926-3681d11c16e8?q=80&w=1742&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------- Tab 3 ----------------
/// Button + Snackbar
class TabThree extends StatelessWidget {
  const TabThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Button pressed in Tab 3!')),
            );
          },
          child: const Text('Click me'),
        ),
      ),
    );
  }
}

/// ---------------- Tab 4 ----------------
/// ListView + Cards
class TabFour extends StatelessWidget {
  const TabFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade50,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          // Card with custom text
          Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'This card has a custom text.\n'
                'Cards can contain different kinds of widgets!',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),

          // Card with an image
          Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1756745678835-00315541d465?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'This card contains an image.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// End of File