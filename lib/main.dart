import 'package:flutter/material.dart'; // standard lib for most of our apps; gives us access to visual components
// 3 main visual componenets: app bar (menu), scaffold, text

void main() { // entry point for every flutter app
  runApp(MyApp()); // takes a widget and makes it the root of the widget tree
}

class MyApp extends StatelessWidget { // think of as a constructor; initializes objects to be used in methods
  @override
  Widget build(BuildContext context) { // grabs the common features of material design
    return MaterialApp( // widget that introduces material design to the app
      home: DefaultTabController( // provides a default tab controller to descendant widgets
        length: 4, // will change to 4
        child: _TabsNonScrollableDemo(),
      ),
    );
  }
}

class _TabsNonScrollableDemo extends StatefulWidget {
  @override
__TabsNonScrollableDemoState createState() => __TabsNonScrollableDemoState(); // assigns state to the widget
}
// _TabsNonScrollableDemo is the blueprint; the state is assigned to __TabsNonScrollableDemoState

class __TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo> with SingleTickerProviderStateMixin, RestorationMixin { // state class for the widget; manages the state of the widget
  late TabController _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_non_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() { // initState is a lifecycle method; called when the widget is inserted into the widget tree
    super.initState(); // always call super.initState() first when an object is created
    _tabController = TabController(
      initialIndex: 0, // starting tab index
      length: 4, // will change to 4
      vsync: this, // provides smooth animation
    );
    _tabController.addListener(() { // listener to update the tab index when the tab is changed
      setState(() {
        tabIndex.value = _tabController.index; // update the tab index
      });
    });
  }

  @override
  void dispose() { // dispose is a lifecycle method; called when the widget is removed from the widget tree
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose(); // always call super.dispose() last when an object is removed
  }

  @override
  Widget build(BuildContext context) { // basic app structure/layout
// For the To do task hint: consider defining the widget and name of the tabs here
    final tabs = ['Tab 1', 'Tab 2', 'Tab 3', 'Tab 4']; // will add 4

    return Scaffold( // provides a framework for the basic material design visual layout structure
      appBar: AppBar( // a horizontal bar typically shown at the top of an app
        automaticallyImplyLeading: false, // removes the back button
        title: Text(
          'Tabs Demo',
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [
            for (final tab in tabs) Tab(text: tab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // tab 1
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Simple text widget in purple!!!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text('ALERT!!!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("Click Me"),
                ),
              ],
            ),
          ),
          // tab 2
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Type something',
                  ),
                ),
                Image.network(
                  'https://images.unsplash.com/photo-1548915135-ad85929387de?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),
          // tab 3
          Builder(
            builder: (context) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Nice')),
                    );
                  },
                  child: Text('Click Me'),
                ),
              );
            },
          ),
          // tab 4
          Center( // ListView widget
            child: ListView(
              children: [
                Card(
                  child: ListTile(
                    title: Text('List Item 1'),
                    subtitle: Text('Details'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('List Item 2'),
                    subtitle: Text('Details'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('List Item 3'),
                    subtitle: Text('Details'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('List Item 4'),
                    subtitle: Text('Details'),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('List Item 5'),
                    subtitle: Text('Details'),
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